Return-Path: <linux-arm-msm+bounces-93507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLH5KnxumGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:23:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 572A81684E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7E2304C0A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84C434D4E9;
	Fri, 20 Feb 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5gmk0v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Efj5bb6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC6A34AAF6
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597426; cv=none; b=X16L8IzhNpjtXw2hKpvvm7jBdp6/qsBo0mvjd170Y55fPGAgfY5epg1qitKEYECMnoRjO9GCRIBrtw++CcNeNS1anLCvcOo5GvK58q6wHJmSPmSbzSW1RYLql6BDzuIF8HFQ8LUr7e7PAt3T0/r9HaCmCBZ3vljgep2PCV8iyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597426; c=relaxed/simple;
	bh=uCF7qvobceYS6z9HSaHIPq7B4KPyc2ZJ43g1gF2pAa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAvwd6SlZypDCWi0XMB9MiDVEQetDN9Zglma+5fGTi76lv8XC15VY6P0TTYdvNpAQBi0MstoZCe3J3ySbRHbmHLmQhmuArmEttH3zFpkfMXXLSt7lwRiaVKO+MyDsdDZ7IFeog0n7Egsf0+rTjciDgcC3V1IxJ4vD72gbfEDIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5gmk0v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Efj5bb6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RieY2430512
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep58c1uONEJWh16KZB0/5Ua1fzrTzKmxByn40SRCzCk=; b=E5gmk0v5hCc1N0LK
	6xY08qSl7LqPEk03MvwD/Jdp5VNDWTnZXb6TDXsspO7ALHHxsUicsUwYLMgcG8et
	XIZO1WPAj7l5paNh1zeYvukmCT4oDkblW9nDgAjAaRcDGS8kufPJmfrf47mTmUby
	2URYHw47Bt/C+nYxpjae+bRhjiNQ37yMFBR/BBCc5jAvr6nCTRKJIc4xlc9JnGKC
	EHDrW4fdCeSd3tVNi75qBJ8vlqYMMlYQs4t8csBz+MFaNhXcyPThkuSfLsIZDqg9
	Mm17PG+FECFXkuzFeVSSEXLWqha2AIVhP/bvYjQ/dgY7J7u4jdZwnh4ANiKgY3mg
	f/PJAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh4j19jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:23:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae146bab0so23244285ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771597423; x=1772202223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ep58c1uONEJWh16KZB0/5Ua1fzrTzKmxByn40SRCzCk=;
        b=Efj5bb6F4OVmHEoR5Mng6rvhZpQIh5X1TQ8VUIO6BCVxgQpZi/JycgMKObH9JOunXx
         EWYR8iw4ING93tISvCeYv0cMARdkojsRrMDkGdFXdZWCIXcxTqJ9ZjKyHMzCg7tc93Sc
         fUPWRR4OOznkKF4QyydiGaWxZfVGX5m7fCNMKetBWJqeVLS+fMjLYpsDRX42KBns5lyQ
         931DJZbhecG6mC5e5eBPBaJdzxLoi5xd+A17x+MGMI9KJO0/egpsddvOMVMhhgdzQdek
         EELBxG6XttFW+URs6QtxvM9D+uEbm0FzZSoKPsP0t0pCsaLjkKvjaIsQt9Lf6b0EMPiC
         yk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771597423; x=1772202223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ep58c1uONEJWh16KZB0/5Ua1fzrTzKmxByn40SRCzCk=;
        b=dVbUS/mPUECdyiX9fwDd7A29Ae+sOgqfJnZOyB8W4LrUno/x9Il/v1j+grgUxGrKBr
         xgoHhQL6FDcC8An/yaKhbxKWFl3uGsD/gwHpb9Cn+26ZmoohHloPy4zb8KocGGN6WduJ
         7zp32+JSwb0RwYVl5UuIVwRIf2Wph17hnVGnaTURwYmcWLifZ7TQ/T4CqTNbhix2xVTl
         iLYZW2QvV5n7nq+jF2IBovfPyEUqL8IB8xPhLgpaXRZpgx2ssIexQFVMZTPXzxQpga/6
         o/dfMkLXH2UPjoWXkmBvrx6+KuRHFkf9U89TqaAqamd7AbBKxF9RbWH2g9+Hej/F351D
         ptiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvXbqKwbCbEHaNi/worDi62WnWsfYcB5rKPpbEEJbovi3iJgKniglPq/jA5igbBfgbpOS+edNKG8R/5Ce@vger.kernel.org
X-Gm-Message-State: AOJu0Ywefy46VZtY4eOD0CCv1kPiPCZTFqH1qxHMf8xLyd8aw7td2may
	QhybEu4Rzy/Nd29AOLK0o1ILD7OaZBESoUaIs+eHRD16g3qBwE7KOcQZyul7iRbI/6G5yvzehtW
	1Jrw6Hui21rctWsnsefja0nkHaxpjFoSR5RJBop5YouhBAC34V7KXA6m5bf+PdYH6SJ4J
X-Gm-Gg: AZuq6aJHLIOXIe083oVvCIljdE98DbxqZC0ONjh6AXtzc9ttkpbpGWMikGwIm9c4IIN
	9NLqIIvdjv+NgT98DFh8E4966L09SFmQXc/EKWzwbPlLcpGIjhqJiY4IH0jqS2o4q3MbeVMy2+G
	stBHYk1CuXJxFrXjLk1XQnDt08nNp5aMr1K3Tt4DXRZARThV3cbGFz90gTiTeIrCrWl4kXO6MZJ
	t5U+xEXf99Xg7kRL1fIy+MNHc0bSP4YBFAO9sok+HzbIbhQNGr+xMxRR9JU/kZYxcZQak4nfqyK
	jsSKZUAefP2dZ2lACEqFjFy7XqhyAc3SQE/Y685E2pa1K48SJyS2GsMW3aJ7bn+lcNMdPgBvY0b
	Qpa1tHUTUE+jyJzzRF76Bp2CP1mtfIEq/z0p2jtQJuJGCDIH4Iw==
X-Received: by 2002:a17:903:240f:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2ad73654744mr1512895ad.50.1771597423341;
        Fri, 20 Feb 2026 06:23:43 -0800 (PST)
X-Received: by 2002:a17:903:240f:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2ad73654744mr1512655ad.50.1771597422825;
        Fri, 20 Feb 2026 06:23:42 -0800 (PST)
Received: from [192.168.0.195] ([49.204.27.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa34bsm185257065ad.19.2026.02.20.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:23:42 -0800 (PST)
Message-ID: <c8e9eb0c-9c49-401d-ae4e-21dcb1e1e843@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 19:53:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
 <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyNSBTYWx0ZWRfXxGhTSzoFNxlr
 CNkFbjA3fEu3HP8jv0CTm730JAqPZz2Wr3A5SUsJS7rsBLC8cK5FMgU0eoLEeCVvblDLphCDaIO
 u+gQ2YsY2hGoUGelZ0EUVW4/WBspUu5j0YKJgS/yIy7dX4gGLy+XgjYCsSty8zTyHx4ZLl3v/CM
 1ojuHxfSw4b1EaUi+uSdGxkzlZT4yU+Kcosb2XIHhe2LYNWXjpyaB47u7Kh2SbEOYxNkCzyWHXZ
 kci1m2NwjWIO4UQ18LIsCtR+bPkr1MHzpashZlqqmNUUgWTJm46Ru6/EWYZltFTtuWNtl5c+aOZ
 XwH12CZx+Lkbkaq4kuhH0ifzr6vctAMX53Q8016SR1Zq6m/9i7sJa9m5r9XJyBmFRvM4ySLi1KL
 ev4iURvgBHG37i5CX/9OXM3o0SHp4QHcVfsKrOzecckwfqMAXBuWt0NFCzRxD74rj8NGE5G+o3H
 cs8CCNNG2AT2/zJwmjA==
X-Authority-Analysis: v=2.4 cv=R/0O2NRX c=1 sm=1 tr=0 ts=69986e70 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Zk7Ki20fgETz0Ru4rw8ykQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=1Wy0XEOAIwHSON090m8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yyZwAQwSleriHaSFwOwKdwW2xXScsBS0
X-Proofpoint-ORIG-GUID: yyZwAQwSleriHaSFwOwKdwW2xXScsBS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93507-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 572A81684E6
X-Rspamd-Action: no action



On 2/20/2026 4:25 PM, Konrad Dybcio wrote:
> On 2/20/26 11:28 AM, Taniya Das wrote:
>> The camera clock controller is split into cambistmclk and camcc. The
>> cambist clock controller handles the mclks and the rest of the clocks of
>> camera are part of the camcc clock controller.
>> Add the camcc clock controller device node for SM8750 SoC.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Update the MxC phandle to use MX for camcc node.
> 
> My point was that both MXC and MXA are used
> 

My bad, even I think I got confused with this. We really do not need MxA
voting as it is always ON. We can sustain with MxC only.

> (I see MXA particularly near CSI[24]PHY, but it may be a fluke, please
> take a look)
> 
> Konrad

-- 
Thanks,
Taniya Das


