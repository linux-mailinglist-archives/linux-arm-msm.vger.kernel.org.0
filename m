Return-Path: <linux-arm-msm+bounces-112344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9YDlCeMgKWqMRAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:31:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FE6672FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CoVh1E+y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CgvSNM45;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112344-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112344-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A127302A58C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BE03A542B;
	Wed, 10 Jun 2026 08:19:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F4394783
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:19:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079544; cv=none; b=qm6rjx8cgPjXrm7Xne8O8BOF5KRHAew1qAXmhRVHUQUQn1qP0hHRb7hhRvm+A88wQFthIS3jPtHbBYLEUz0dlm3oFJxtLvxcbf6SJB5bsqpe6xDfeARJQSbwc1K390mZDRoo8ZR9gGrLDsEdQ6097etsU6k1I9taqBWB6FHo5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079544; c=relaxed/simple;
	bh=jcgQSk0c1BkwN8IYKPV80uEI4CWqTwQjByoyKnPKPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7fNRjuEFRXRHdFd7n1xd9tyYiv4x4lo3MhB16va1YXvWjP6xx2jK398evjtEByn6+rnkyLPR0J7Tqr1u8Z3TOOOVAcSXct8EanGUVYPdSxpUAQJ0k+EMqGBODJ+5zy5ogETrqNx5xkp5ii16JAEOsD5o4Rc5yA6wiT/Q0ktt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoVh1E+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgvSNM45; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iFfX567797
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=; b=CoVh1E+yVLCZS8B0
	AIMWFld+J0lPVhHHBFdT3L6jBHiwoe8QpKNz2wY53wD13NTu0S/H3JQr81WL04Kc
	4+/vJFhyet3VhSDmLoNZ5IDU6puP3WVDOq1t4+DHrSiuKasX1TJf/Lab8SF6NZnQ
	/x/+lOPmGfnfk6/jdcy6+AiPxaQiSD26nEDeXiyXUW7sMTdihU4uG0c5teTnuhTC
	HWWYhsuDwUn5o0UgSXH33XJLW8FNBtRE+mF5zmp+n7D/TZXDmDTlbKEA1vDxFX6I
	CJcNFd5ldWPc3i7xOCZ0BiS4iWKiP9lj7EmGb0KbDuhypSKN0HUpOJsWwxkzFHCi
	Flfc0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jwpne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:19:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517a00fbac6so11074841cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079541; x=1781684341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=CgvSNM456H0wmNeaVFf4CO5D9WL4pHYD5SuU2Lz33SHJnQdpkhVKOfESCQf1MdoOct
         ANakM9xmypBw/qYLyir+YfqvKx7NcJLnDFhJ0fHPpLlWlwJa4iD9F8D8mcR6p1Wbpohw
         fIDk4iswMx9i7BqWJWbIupe88DQ1pSOMdjK9JVuorBEu5HNuNER6CYCL3d8gz3/knKzI
         OW+aZhhVRKJL2ICJktszb7S3nEsZZzmwjdkca5Otd3OCE9a+TBoVvYGoyl1rlmDbUqUs
         AGWuabMmryEcMY3I/w0RxxLhHuDzaMk31U0f58+Zx69NpiE/50DXL7Q1tLzLJJrrgx42
         L2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079541; x=1781684341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N8UA7WOGRwcku7bf60izdArVt4JWeIT8+sy0FsUlAE=;
        b=FWym7z+uR7WqUKhcecefExrYCGTbf8EijBa65eY0lQ0QLXBs5xY6qkYCq8B0aTCKEN
         8Jd/jl90ialnGzF+go3+r7+n/KFaCIx2+uLzAEpIQM85yWbr0iQIRyvtvlUM/iY/8bXe
         VHfwMWUaraWN7viY15A66oi5Sdv72TMikKi5P7lDphz5asBX+VZgoeKMcObzyDiqce7O
         Rg3x9NNLbIqbeUMTmlIZS/PxX3orQZShf8rNUIyy+tmZuA2e0k2ws1SvtxpTp4Xw9vxu
         6waVsZiXtPwLVDtgqc1SA8J9fQKFLoqUYHBCv+ZiN/R8WlgSAkKOH8BPMCegkOEsx/e+
         fIXA==
X-Forwarded-Encrypted: i=1; AFNElJ+4sOe6/NEMsax6h4iD0NUJ4250nKHwTAU1qK9toAOGX0VC5/VRLebAyVkp7Cojk3AvwGQ3O2givPTUKPAB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzls+WAVTbV5q1MrB/U9IYc9Z5fuLZ9fQ747HTLmk6lXMyBymwj
	btmO15Z5JzFVsodirbZBci6YVUFLqaZ1rtG384e0a3xAKJ3BIuzOjt6h913hwFze+8Bn2FVZ5IV
	Xr3EYuy+ExnGOurb5bzTHwQufVuc/sJpDy7QypyQs3f3J0UHa4JX1O//FSYpb9Lv5uMkF
X-Gm-Gg: Acq92OGJU9+fN/piS/gM2ldP77H0jRfCDTIYj9b1cwWjszVnxurxL1sbNpc5YGx4BUJ
	ZZENx3Z9PsyEx1yKo7pobrloYm72A9XqrdlVY1zYUI/88QRXDA/DZeRrdXLRic6BM7PrZxRj/R2
	aUHtpem/1mhnmCzkurQR7UpZ+6+tH41SV/lS5Oz1xNnRwiEtA2mfplDZoNmomtKhwx5kIPp8BQ6
	rcxzF/0c2wUJv2g/l5X0VrM4G1vI/+CKpY7Bo5Fv4vxbuYCFnOnZKkdp1CuWfabiz4ybrQrYRWX
	UXZBSOkKotc0AqBGV/GqWg5gIhND5Tz5zAfIi4Nxe848SSYJp1FVqDUVjpxTp/1QxrzEBwOPwHP
	511YB2WapPbU0fchvpBU9ILLQTLfBy8+zJMps3V8UdwBUnRiDVQy4ph4Cst6alu5YcwR8jm7uK7
	KjiWsm//xODxYdua1cGrU=
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785411cf.36.1781079541319;
        Wed, 10 Jun 2026 01:19:01 -0700 (PDT)
X-Received: by 2002:a05:622a:2484:b0:516:e1d4:553f with SMTP id d75a77b69052e-51795c4fcf7mr369785131cf.36.1781079540949;
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Received: from [10.111.165.13] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd051facsm223943196d6.32.2026.06.10.01.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:19:00 -0700 (PDT)
Message-ID: <296e084c-184e-411d-9456-375933a9c16a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:18:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KRldqKsQzEeAAR8Vj52YrLukIu1sB6be
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a291df6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=3LiCsYdCH7c6jQhj-zEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NyBTYWx0ZWRfX9NBt9cnH205F
 fzZO9PKxmL4T/hcfXrr2Fy7hCNAZ2ozYx7BLCqaxM1O0dR1EIR8syl2YAnNLPVWe7Uuvl2rJLgO
 02zUv2I1NmPqIy9we3Bd6fmZeM18RtVMD3P4XiCpmw/8Gsk7JRF97HPRjpj4Zu/dzAtthzNIoKu
 UMqdJzyhrbb4Hzqw1qput72JBj3gjmeCbxP/COyFDtFgXb/cyhWB4+32ZmKUBmN1xj4aGuF3bhr
 6dW6K1/CGhQd4290lwCFvCeTUP0db5ntZjgMRdv+Taw27INsP+WzmZd6OMTmNJD3Hgjo8+99332
 rjyULSDfpheknZq07pLFoFXbQfVUyjfxhpfGaBUZCpZ1p3uplhCgtxe1UmUPPS7JmqWYr4S3ut9
 sA/KcuwxZQ5ia/NV1F9PUbWRAWGSySn8vxyqmei9duq/UfAfcS+Br9vGwg481qN7NazM9Qh7dNN
 dhhEPvWgsW2xR2/983g==
X-Proofpoint-ORIG-GUID: KRldqKsQzEeAAR8Vj52YrLukIu1sB6be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112344-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email,ixit.cz:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C2FE6672FD



On 6/5/2026 9:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
> 
> Since there can be unrecognized configuration allow returning failure.
> 
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

There are two Reviewed-by tags from Bryan here.

Thanks,
Wenmeng



