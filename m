Return-Path: <linux-arm-msm+bounces-100886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEELOcTHymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:58:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 922AC3600B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9EB3055C57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AE03E0C59;
	Mon, 30 Mar 2026 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhZAWK6c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icVUEc1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2E13DFC8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896981; cv=none; b=Lu+i1MRTWSA29G3ZaeO613FBOCeKll93ez/9cugFNZIWJFCY+uLX/JCecLacR/uhMaHNSiIJE+/kY3vfb/tP6G2bDdcU9Sady6+bN3LAN6ly5iX1DxmBnXa9ni2vVEvo6P8Xb8EHCB7QD+lnc+qAqGXG4Qzpkeu02d7zCaxOSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896981; c=relaxed/simple;
	bh=yHWPRys3U05z1+fNskLwUYRnO/48PBX/IFQ3Wl8KjH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHdYZyRb4fxbVEi+XFVH+Jopp46Z6SiX4u3BYIA6/hr3KUH5iRJH3lzkFT8iGuvkaxqE52O/3HRM8o04yDXLL/VSWwlKp2A9IDbIFmtaazAiMo16uQi+zIqoPCgtRGL82uDy8S/6c5H8pXtYbSE1SvESL/hVB4eZ76RW39s6Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhZAWK6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icVUEc1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UDde512458383
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=; b=HhZAWK6cv0Nyn4LX
	LSK7kHxe7ovkOblAPIFEJ3oO2/IKSgW4CXLQfixlc3P1m3tzX6yNVSCSRe0lk/A1
	btd9VNQQgo+Ta6wfeeAtg2jBwCXaB8vzB7UZgOHtf8tKI4EyBekr2Fi0BPr2WLkJ
	XqAi0Yu8asfUbIhdY/H1KP087hIq0l29+Otv/5PlW0SvYLtDZBlUR+9DUFIpbl8b
	CmkMvz9KpgjaeSGvHDikq3KvyTIIKnVDlzJXEJSIXf1qO7jcjioB500reJVLu6uy
	8XM21xtmO5h/f/qnRx4qTYsGIzsgZzlk/NrqwOUHoDix+Mx4u/e4xMrN7Fi931BH
	zAP3Cw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmtkyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:56:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-128ba70cc99so3400334c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896979; x=1775501779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=icVUEc1MD9HW3VA7lAtOhYVkIR/J2Hcge7yCoTeiarhKrhaB+jc4x9eRTztcQPhtiF
         KUKo8PXW2u62vzOVXohDENvphiBX7zLNZmo/K4nse8QSwA4xESntn2BX25BmdWSGqj2f
         tRcvYhQ+UgA05YMlknbCs42Fbvhmpuu+1NDwc4qAAB+cr/aYuy7Z8dbPAQyRnhdFmt+M
         wDfxppSRXlnrJ/pg8I7Ioa3G55cQfQF0Iqg0XM0Lr2A5gkPhIWnyjQf6YqaIaE2TXnXb
         YCIBQwb8C7MADq43vXoX4ooaCidU1y/yDjceLGAeC3tKbTk5sXsSuVrowkIVgU8MdhVQ
         Akow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896979; x=1775501779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=adp96dGg2x9K9TwrGnbO1a1J0bZY4NwRX5BspkHNK5Vhnxe2chB6JaCcvTLyLNaHl/
         1EZyGEbobFx48Wz2UmAa4JIbqKNgdqH8tpBJIwyokiHpGqwdsHXTfOBDf/So3NZxJBZA
         KJ4hOLpKR5bsJ5YnXFY7RfVUm5i5xH5XfDuBKPk/4HwhbPIDe8zOL0rZPrFBAr0h3AFu
         EkpCOy79weMA8kvD0rqF+hOEhdsE3cRGwQWgARppBo3p3D2Hkgn+DYZubuuaKiEW3o/T
         UJducLSSV5bSxVShn9zCQNhX/eVSWBu/RW2cOyQPj3qb9Yz5xdx8Tqd9K+HALnpexBds
         HXRw==
X-Forwarded-Encrypted: i=1; AJvYcCWHP1fD7k62QqXlkywtXnmk4jLaJMzBHNUFwsbsM+FHwfiLrMughOpY1dpMUIm7eCRUTIlDBnclLnAm/oqf@vger.kernel.org
X-Gm-Message-State: AOJu0YxceXi9qoIxjs25/zsqawREhdCJnf+z+3338ioQHHq7O3QMPiij
	p6KKOeSSDaZXF8+mmnXh7anFc7G1YoR1yBzi+9fuFfkf31bdsFgltifwrg9Qu7ppR7Jb5tXyyf2
	xM37dF++z+hQ/6bR+25/5UBbtaR06PE1U1LDRE1BLCm1FYgc3/nnTq+HSn/MBAHaH9Hcm
X-Gm-Gg: ATEYQzx7DTAvUxH3jZAQyJlnbT1+uh5qP+qroO7ROIWrIyXUSH+tleke4fHD6G2/iBZ
	730CX1sOVZWZhfZ51C9WPEh8ateYfp1/6+vhWGBSTNnGe9Iy9TJFu0/dOPZE/MfkAnDXSIbfsH4
	Lz8nXO0hA0Ym1i+KvOD63jAhOIdskenIvBHDWPswEDJ2Szk5zv7ZbiNf+lyi5Zzl3qiCbkQUWB3
	6ZechbtomSv5ahWHJdiyhrvKlNhVeCS3X1p+PIIkkJ1LLoPOKqqMCuixSJ+LnA1pKP/tO0zuTl0
	7COM9kYkDmuhvZv2z5FhXMApwPu6vsp76TpV/WR6OMdWMxYoDGcg6pkrDv/CRheK9oFKZZBl+kk
	mPJKp8gE0U9qZEd+rTlMW/a2ICDvKwHS4B6Mpwzwsyz9zsSiPv90uVdtYPyQScEUAt8Qbvw3Kxr
	gZM0YeUkmpZWAlbQ==
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701491c88.6.1774896979006;
        Mon, 30 Mar 2026 11:56:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701468c88.6.1774896978404;
        Mon, 30 Mar 2026 11:56:18 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac4a0fa8dsm4890474c88.15.2026.03.30.11.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:56:17 -0700 (PDT)
Message-ID: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:56:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir
 <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX5MPbHuY0Gp6V
 gNlvBNVaEq1e6coZ21YEoXn2pUNVNQQ/kRLBqkYEmkI/AijVjzScJ9kVvCmjwHp5GfOSbO8TfQM
 o61/2bsXtEt9E3VFnVYQA7xLLi2MBbdSRmCeosfdOoMsEjvxJB5PIvDdQEZkRJ1LINZcMxx5PDm
 a+XtSNhtyfSJwmsF1JoY8o8yPKe1s4K1ClnGcNPPZtRPkQFztDkjFJ0B5wsJT/odDkS1bjV6KA0
 7OgGnVChktJhPur+PYYcCS3jYo1R7wtPlCnNHY0z+oyp0TbSAZa3nwVPKAbS8nymt3Kr2/uZwF5
 YXMR5jsAO0JlkIlBKwPZwP05tOwDFu703rq0gxTFEsaQXa5DAcfCElaixG2Dl6Lh675V14g/YCA
 3riNmGu5QXTKvjLxmcR5xhP8Dxq/YeALF6Wm6StjNP4CUU+6/nhAMGp/NgFv3z8UTmDlavncP68
 zxGzN2Jj1PyTeda+JCg==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69cac753 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qpm92PVjyM3Q2z6jdXUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bbnRwCJs9RdQMuqnM8uwrJ9gbFTklM5t
X-Proofpoint-ORIG-GUID: bbnRwCJs9RdQMuqnM8uwrJ9gbFTklM5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100886-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 922AC3600B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> Some firmware versions do not support the host capability QMI request.
>> Since this request occurs before firmware-N.bin and board-M.bin are
>> loaded, the quirk cannot be expressed in the firmware itself.
> 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Jeff, to my knowledge this is the best approach that we have to solve
> the issue on those devices.

I'm ok with this approach.

I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
through my ath tree.

/jeff

