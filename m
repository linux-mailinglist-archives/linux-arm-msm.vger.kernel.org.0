Return-Path: <linux-arm-msm+bounces-110238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BmbOaZbGWoLvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:25:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE005FFE69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C0C3086FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C8F3BF66B;
	Fri, 29 May 2026 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw2te0VX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnSzuIuK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796AE3BED37
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046621; cv=none; b=lPduHPV6kPBmCr40uDfIZpToDNIb5wK/jxSypY6VXFNaOA77hXiUEooNJCVz8iFlVqF4TgcW0J81VKvlsvu26nGaV3yYDTe49IgExpIdu+f0VYFHUa/aJrRocGaiRFIti35YaCMv4O/Efv7Da32mS0WIvfve9bvWV6hN4auEXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046621; c=relaxed/simple;
	bh=yKQGwCGb+Y08ygukP6FDC0FdKGY9Z8KzEzx5YkkIu/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m71QvsAOBRaGrVWzU2uQIy50RBDiT3r31v2NDYCcxmttpMEiHf3vHES3BtITIWCdeMWcywmt3lZ28fyysWTK6pcZEVI/L7yR4XhLgRGhsl7futlP8Y/bXtmAs7qgUfg0RiELzuml/rd+1gMBO3h9oYWt92u4Zb/6BzHuz12ya1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw2te0VX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnSzuIuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7iTx62258584
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=; b=Qw2te0VXR6O4S1F3
	yYn7Kc3mAPuTJ4gwjM552fM5yR7nwNj235JVGhLHpGzLctX5cUmbSoTTrLHI8I5d
	Ye8q4FsZrciQKNnobtUcxiJwjlcaqDIVcKMt34PBNWGfJTXfF7ybKvpvXbJLj/E4
	SttIlA5C7Sq8Kl/TxN9qEfV5ui46nQ/OAvH8RcLjUNkiXknDEmYvkUCddB6X0hef
	og4AkUrVgILTYRO78yLg2/w1YhSQERZRvI8/tjGMuwzx43rOzO3E1sZG1o5sX8Po
	B3hdTU3oWv1Fu5y6H5XS9q5E4TtS0TZlw3qs+RWu05rnx8evUguDrxe1fr81JCBF
	5s6EXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety53ack-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:23:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74bcfb86so15569920b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046616; x=1780651416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=EnSzuIuKCz+nuHWnMi4XQ6pvou3dQsR4iwIYuUUeyBS9N+BGkBde9YYHLkVRrSY9jc
         Uy+9jgql+TiPU0ZeRlqjTmO8SahaLJFSXiKja1CslPZutA3X5euAtNeKxRuyJc3xK0SU
         87hWr1DGZB3RT5CY92+biGUOuMnENLwEIpXhONHadsF956uPKBUg9AvSGvg5180JtNM9
         UpAcg0rlKzaXSzV7/rImGjk/gkEBmY7mWlX2mZGfHojT9ryu3DD8vYlsaxNr2ooJlXSG
         ANnFwr9n/NK+oUr5WrbrPlaB/6bWL1nGgjm/4y4mxAKFtbzDxz188BoErctINIlRvQ67
         eWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046616; x=1780651416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=YiaPHodiQDlGPeL8BAGI4YQB5ThvVcdH5V4LOKa+U5AL58OXatSR6glw2gxpva099Q
         mxZYkCdwLyDBleccVUQl4zcgfzJi0JU1+G9GRYa6ODRSsjPV8NoycidKq0wyA3t5GxAr
         xmCIEpxbixQICLE8l35Ae4dFD7TIKXcUx6RVlE/oODlKVjGtGwgoJztJmsV2Zfwhrj6m
         hMHrrDet5SLi8xpRNYzwCW+Sej3nnCAvN9cgkWgeDi1QzzYHiYSc+/RGTEVjiGZGSJMm
         IICCjs8QXZIX8NnyoDJDbDPNtsCXx2PejiXY0W1ogVmC8Dau230KnHmyE3Auphw1H+ZK
         FjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HfQlEmpr0O84pDVfi8sZ3t84jUZn+tzh9Cp0lMcaaLwa5DBckg+0xGY4Bl2r9FfMlYaOf8OpbbA1DAY56@vger.kernel.org
X-Gm-Message-State: AOJu0YzAFrXvWvCYYGpOsCroFmo8pMleJjVQKkLtDm/vo5L6l/e9Pwdb
	VgqO+agZE9UJlvmyfobXZWhjD4SFgJWlGvGtbWyaNHkYMy38JZGYNU+xfEeL0sARYKOKtOoaAy1
	qG9uzv0cSqo5jkPU0VEY/hTw+JhchN+OqMEW437LMITTqL8vtl1bPoLMAVERi/78G86iT
X-Gm-Gg: Acq92OF5FZSRdfn8Pf8RvmgJ385Z74Xr6j59BT5KVWn27UwyGGjzdQAEwGpSid/gYVS
	dsK18Fcn8uc/aR2RVdtdHjydN2akRRjhWV8ExH5cN6HGOjmL0hnRpkky0vOiSzwMshGBfUGpsot
	k62+o/0tC8y4gkCy7TAA2JgZrUxEwLuclPSC3HNLaazkoTe4BhX/+ASTNPVhlNVDbbPIMaZZHq9
	4SATf32kEdaGkFcBKj4Nk/yCj74a5ArrXUSA0MYrcizgEvFqJG4fqT9zVkoqNAELLfvP9NU47IA
	yLqGisc093xD6nFGrCOby1vsDLpQb0jC8Yh1xLBWZei6NimB0AIUAGLs9Cbo9tCCwRprmf/X+v8
	lNba+jPV+p0TCdtefz/S95rjylEjaRMAG9dfzLdI+VbQ5AG1qvMLMPftDit8sgA==
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358723b3a.25.1780046616124;
        Fri, 29 May 2026 02:23:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358688b3a.25.1780046615661;
        Fri, 29 May 2026 02:23:35 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:34 -0700 (PDT)
Message-ID: <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:53:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfXxBcnmGEH5Lo2
 Ru83nXZ36TjnRKI2yZDLzzNeShosNuhf1reRGoMgaABE4f/NpXnN66mpn5jhnFmB3j6kZ0ZG+tR
 KMAxToPdVZlvy3BVCDHkgAuLe/Ljo+rsuFpgl9NKBgmx5Dweji6oh8vYsk0iqnYofXQaTaGDA9m
 znVD6me7OhsuXXLFhH7jgEetCfsgkEKCzz81lG/SiaBCTlp/VX524W+933KvjKy7+/pG1f5jvRC
 pgqLxhPyrHxvNjkTmFtFvsT3/ruw5zq/YXHaSKhf74s4U/zLSAs30VkXh3ljqXZxYhoBww58Nle
 fkbhtO7csVKSAuUevlewIlTijogup/tNCg0dxUssSw49eZLKst/bBa5lFyWwS994ZbT2J7GWWXx
 PmUbMnALzb7fxZ3pC2M135MQ1bQbMkeJkDGhZ6K7quwJjDFmbB3qQhNrOtcU+feoyAl97iPmhRW
 mwmlCcnj0gkGwcHfHeQ==
X-Proofpoint-GUID: 9oIIAz2VrzqI_L6MORQJRCPtHQNon5Kv
X-Authority-Analysis: v=2.4 cv=WaM8rUhX c=1 sm=1 tr=0 ts=6a195b19 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Wv3FfvtsC9jmBwEqIE8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9oIIAz2VrzqI_L6MORQJRCPtHQNon5Kv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110238-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DE005FFE69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>> but has minor differences with the number of input clocks. Update the
>> existing QCM2290 DISPCC bindings using conditional schema so that the
>> QCM2290 requirements remain unchanged while accommodating the additional
>> clocks required for Shikra.
> 
> According to the IPcat, display clock controller also has (unused)
> inputs for the DSI1. Please extend the ABI for Agatti, then extend add
> Shikra.
> 

Sure, will add the DSI1 to Agatti as well. Since we are extending the 
ABI for Agatti, I will remove the clock-names from the bindings and 
update the DISPCC driver to use the indices-based approach instead.

With these updates, the bindings, driver, and Agatti DT must be picked 
together to avoid any functional issues or ABI breakage. I will 
explicitly document these details in the commit message in the next series.

Thanks,
Imran

