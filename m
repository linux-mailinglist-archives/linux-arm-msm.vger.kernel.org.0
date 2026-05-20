Return-Path: <linux-arm-msm+bounces-108881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAEMIWk3DmpC8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:36:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D66EF59C228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E9BF326C16E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695BA3491C4;
	Wed, 20 May 2026 19:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyKqtiok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeiHWmNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44F34D3BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305904; cv=none; b=QQ5u17HzwJt2iD0TlBv5x7XHE+kxOAz2RXG6blXCU9dIJwD4fu/0WZ5Q9XQS+851iXT+NQqttewmGVfE791RDtlaOY6yPggSto8IncL4C0TkvGtbuehXXsN9d7Vf25pS4gLLicUXjpAtIi8T/PyJDO8B6onxxgJ6DkjJ8jQX9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305904; c=relaxed/simple;
	bh=/V2i2aN9ElYzM1ebwDQYVP2EYIEQj7BDWotrGak3l3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y90e/NUxi14J5ae+fEn+LbnYgUzg1Fmd3aCELaxYJ+3Oz9eQ1qTulMtW878rTebBfEyt/sf0ymRXVlhfVaDmn+cbE2nWrlY4UGvMEjHl9ddeJy+k4Rnra1WAe2c2JAt6EqNGfeNCFWjjY+Tl2Kk8Oc3jQpuUKW7jjWw5q2Y60Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyKqtiok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeiHWmNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KG9nvQ1178268
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=; b=MyKqtiok2N+ELTCL
	/G41MzOXI5sSKnKAYPPi9+YEzNMQC6FtVm2VIwSGycBLu4m7SjicOj1IuDOIrbyD
	QRbjYWeqOJtbIZGoaKlrKSqEIYQ+v2tN0Cg9rTRzHKz8ndTRxmQ6Rk0rI0uYIcdi
	H9zTeayd3WGe2hzxdv3fnxadwWvWCKjC1q7kJEX2sZwVQJCnIjA/gh5thdHWl2YM
	rLATqRcQtaRJlc9pUD+Pm3K+erSBRM2zoEjJBNJJW7tdOETVMMPrMIOO3mO/NFTy
	GYZm8rduLfpyO2P4yjWRjr9CWXHjJwdRMGg6mOJgCpgjxiTxJPs4i+YN+2bTH+CQ
	kY4DXA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6tb0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 19:38:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c4772950so2601032a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779305900; x=1779910700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=;
        b=KeiHWmNIv6+jZZBkbweG9p0jSsi+TSgyi/Bya8utOoMgH4hiDUvQCMPHJ9XKDqp1Tx
         h8Bk9JyYkNkzjgfOflZiPQn4LoIpu0Bt6qSBZ3ppqqKLC0jcaN+m4qnaca5qNTdzaCDd
         Z0m9r452GhafOy7WcFq1NXkfY9ntaC9KAYlVOO/3BlENfayZyytNSl7LiG8yk0QTSbYK
         tHdsEifqZKKz/BL1RzN0s/WD/RIykpCZAej7YE64CylSPzVCL90/EK2vmbOVlNanw7Xm
         9SpL0Lzx/dvx2OcJbGDcVRS5t/J3wDkYGF+hyV11z+6uZw8jqmzu3npaE0nDWpGpL7Bc
         SQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305900; x=1779910700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=;
        b=XUoouLbYL0MlGsOBLFmknPX9FGlkEbfCmmVVaMbRkivL7VUBulqgvSooj/SEU9S55h
         n7B1kubbG7UX0JHsFfyz4/OB3k27JXm/gLym0Osj2P5NtXT68ghH4iQXReBdjeeA+oPk
         So2VNU4wCXuUEM54qK7n+PZpVISl3bM+QjeM8dnMUyEKvhhCbbMmioO0vdJ0TSWYcKKG
         Zq6tKYlZMsHSRZWrg486mEDyz5TY42suM9ukZUYCSaSDXZAVyERGC0n5osreAWu4DYHS
         0ZsG2isMtmONGCWkrXM93UV/G1upEeyToHh+nAaS5tDlDTl1AcnKXElBC5jwvZraqInT
         UiRA==
X-Forwarded-Encrypted: i=1; AFNElJ+tubagWgzb9mHAeEyTj4MbuMRpDkwu4Js2CKzB0WwYqtJN17lxMnuJgRsJwQ3NGkaQX6U9m9+5ilpPKiMC@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSfH+l12Uks8AaMz0EnSaOssN+XUDKn5CksYJIF0caQa68rQw
	46tSlU+ykVpK9x6ngH1hUXKGrquNBrjTwti+gVwXo8c0vKgEXUXPm7Kjo5EwTd/ima5/YF7wkJ1
	1BHYkqCCcL82HXUbrzvZEGHwMYG8b+GmUCddtvN3Xus5jdnBZUXj3/QKl5CRTfKUbXeEb
X-Gm-Gg: Acq92OFureHgDiW911AhWE8SWZwYEXpxlebU2QYx1R49Vf6pvgK/bhH2Hw1H89TsZ1u
	3d0ZywVzuBZ9R5pHb4gH0vPpMt1tGnNh3yOn/gyIkyMZ++BsqiOmHBXrXRX2CeczlYPVJ8QA4R6
	MuwNTfyTsmLljnSzOkikMa8m+9RZiDm2JXBEQ6BkYabSQ/o5KzZCkLMQWmPYTUTUh7EOicG+dl3
	mEf/9FNAT4glrgYKQsSgstdLXSLB6VGJwjN4+BMLA7Dj0tLRqSYwdsYgkaWU0z5b8xKPvaWiG1F
	5UmOxiIq7GkJ0S5qtaVlP/CGFLVwxt4B6cnwlH+9U0vfU2eUc/Be5vFlTESNJNsYRH+9pIXsuOQ
	iwQG6Vv652x7zABd1M49uXqoU8mozQANlYKHqy409HCnZopxNs3+jWJD4jwxGPNdrLMe4x513Pu
	4VdanhTfEr
X-Received: by 2002:a05:6a00:a10:b0:835:36f5:17c9 with SMTP id d2e1a72fcca58-8414864d999mr613710b3a.2.1779305900526;
        Wed, 20 May 2026 12:38:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:835:36f5:17c9 with SMTP id d2e1a72fcca58-8414864d999mr613692b3a.2.1779305900001;
        Wed, 20 May 2026 12:38:20 -0700 (PDT)
Received: from ?IPV6:2401:4900:9074:ce4a:59fb:b330:7e10:e1ac? ([2401:4900:9074:ce4a:59fb:b330:7e10:e1ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7ccc7sm26114065b3a.58.2026.05.20.12.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:38:19 -0700 (PDT)
Message-ID: <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Date: Thu, 21 May 2026 01:08:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9n3djlfYKZ7hG3dZi9RPOcn9MbxAy5tq
X-Proofpoint-ORIG-GUID: 9n3djlfYKZ7hG3dZi9RPOcn9MbxAy5tq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5MiBTYWx0ZWRfX+MTMbJ9ntcEt
 cGjKLYJcldVXfCmqhAu98ES3G+ZWDZ3z6Bt2TOTENcAvYD+g08jTNMkEiEdP+NhsuIuX0rhEV00
 iiK6b1EixC8J0dlAhuHPeU/oUuXF0JxeTbfdYT/HQgvlQpKCTut9+SvVv6NMq3MBcXTJ+yKRWI7
 mxOSHhiq1ctzdnQ+mnotRhSIqrKK6jDsWGfh/iPOxx+17EZfy/xMxsL2LLOt5Nu53Ce4tDiuZlB
 gLbJAxdvjs0fSx06KG0rHSQemPCFO9iXLP6Fi0EaekRyTkA9/NSdI8QDPtr9z9KafBtoJ9wFRBu
 qNuF5nPIizpH+Vel5B2eBcEasQIfwQ6gF6fAEqrxvfQmfNOIzBgQeRI9cb189vyCr7OSyy70Fm6
 j8AziDt5SLIiv73vE6DnpcJBnpf05pOPGxltQZ6g6qgGdOfXr06Vdi5XjlB0TXCmqFJhXZqJPZV
 ngKw7s3fI245f+pLYiQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e0dad cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=vrFTKMbr3VGxMADgOxUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200192
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,pm.me:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D66EF59C228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>> the A8x family.
>>>
>>> This series is marked as RFC because it depends on a few other in review
>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>
>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>> review and has been applied.
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>
>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>
>> For the rest of the patches that doesn't have my R-b tag in this series.
> 
> Unfortunately patchwork doesn't capture tags from the responses to the
> cover letter. I'd kindly ask to spam the list with individual r-b's.
> 
> 

There will be another rev to remove the RFC tag which will hopefully
have my R-b tag. ;)

-Akhil

