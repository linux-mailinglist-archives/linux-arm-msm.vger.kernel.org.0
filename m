Return-Path: <linux-arm-msm+bounces-97979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGdJC0cVuGl/YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:35:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F829B7C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 38A073006B40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD192296BDA;
	Mon, 16 Mar 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9IiSBZK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STW4bfnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005F27A91D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671747; cv=none; b=sWqs1rx8E4UOfgoAnbRkE2YGwT8A1e2LVnbobOfICHh40cf+WneuWpSoZ1/Xxhqn540HEsNdRwDE7Lvs5AgX8GTyaXYzQO2kHqfACZQ5axBFaWvLXhw2w34pzKL3ioG92CdhBWmy9OO0vNxmNC/aTbCaNuYffg8u4obZPQAKBEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671747; c=relaxed/simple;
	bh=d70bjVF6vDRM6k13qSofdJz0KNPkIJwSal2aUccH4E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/olVY8QQf7UJoFoZ5JBUAOW95BosHRQPabdwMR2UReRAB2KivBQypq0Ggu0Eqlc9bi/arHtU/RqriEoXrQ/0joEZTb9d1WqbgZ80gjZS9JnwBbhNoidI0f6yE5PAXuUF1X1j6L2FmWYJj0bdHlRqO60alP5S9bCMLyV4a/+SdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9IiSBZK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STW4bfnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBdvEk2672292
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zo9jN8o+ApUVYkkh7NcPiTaOjGo6lkPT4XgMvJP/4w8=; b=B9IiSBZKXxo1eq4o
	YDY7yiknkqQm1pygXIzsW7C4nGjlu4lbdBpzli0yxzvxy+QXv3ZHV1ZlBJss0ApK
	FOLYR5Ag+rp+euWUiQJHoFNc1eR3P0zJdBrshXgBO30de32GIRVsl/v/8S9pBjBM
	2TV7Xher5fOKBfnO0Zn0Bo3L0h+WDChBfUB6JMZhOhe03HN8NT/Kf3aDBqVOKYyq
	ZS5HhWq6MfTpb/C3rGpgbFnAZFUMTpgXS099OfBhQ+TPzIkugPEqz1ipr8gKjeXD
	3CZdPH18jM0eJQiMzGEA/ti6NWjY0CDzrAeGakYVRBThGAaGwrsk9LsCVVgKQwTV
	W+ssfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xp7mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:35:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd90958f24so256424885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773671745; x=1774276545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zo9jN8o+ApUVYkkh7NcPiTaOjGo6lkPT4XgMvJP/4w8=;
        b=STW4bfnZNSMVO33Nus1wwxVYiDy++wpVbB93IPlOXcPmmoqiY9JcN5nreXDEEcGnKP
         D5qpTJj2XcQd8/ssl2lKaramH/7Yi1rSpaI6D5D7jq7eGGdcX//Kn6qbAhQqRocsQ3CV
         QikLgoKTgW99fGbkg5Xyno3LNDfLV7dsKdW8bp/CckefIOx0xAVWDetbP2TJZnnM6Jt0
         TH2yvzvlKF1oXcyvJxdPpM84cLrThz1XYfE3EHIL+LaVOAJcuW05ToDQRsaXwExR51WX
         drzBGTmm69MD55OpgkevH7uJPShQRiJJgVG0EUk6mkvuCoYMQs3wyAgH7TRY+M18CA5s
         ad5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671745; x=1774276545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zo9jN8o+ApUVYkkh7NcPiTaOjGo6lkPT4XgMvJP/4w8=;
        b=CmkE2wik8IYU4K9n8ygUcEU6HqFTO8iYeZ3xBG4C+tK8DiqFUzvMqzQ/K+N2vhzCv6
         Pw4KF3v9EPgsWFrW4otSFtt0+L95uUIjDk+1/pR9PCafjZ6Kd77dVvzBpIEeUg+ug01d
         IgTgOkUrMIYyxZk+wey+vn8c4P0LKMeaIIO7wToWfkyPb6dvJuul+eKNaap8IA0UcJ4o
         AZejE4bB2xt5i3daGHdLJmVrL1yaCfA/F0vIdqxb9R0TRzXOoJqlbBEX2+wSgG3l15UM
         FPBfh7XJn7lSh4hCWnsw+po5NrO6Ez7pq/BQllRxgQtNwjWEYIT/kJqM5RvLVkGyyjT/
         ul5g==
X-Forwarded-Encrypted: i=1; AJvYcCWr0vWeP4xxJ0eATKb2VBJ7Cp+VBQbmzuQrXiBUQionnx8wnGYMbAdZmU5yBXzqUV/pqzAdAm+mlJkHRVIJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjtwOjUzOYc0yxK6+/6Ny25VMCbGpY7rGoxdJoususazPf2ak
	Td248UmA4xbpHd+pK9M0wvC+77JrfREzX12hUri3aG5D7C+gfU91dMJG3gjdW1TPxIkwd5gasGH
	9aTOZTdik8zUDticBrTQYY+S4Lt2hqmdpstPKE3tKzdX2UDfEOxeULCWoFMr8lyMmXHVI
X-Gm-Gg: ATEYQzzaMHR4WDc9/qOPR/tElZE83cPxTBgu/7gOBDWu4ezXChzbf+DQqoj/jpcv4wJ
	7QzQ8F+thB96buDPZGF/Rz6SUfxJNUJF5P2BeUdfMWTZ6fbiyGaCxiolR1wGfXgaRSvs+dsq11p
	q1bEft+Cj/sTyLVi6vC1Q5w60xwM9Es3knXqWtfoxu2O+3DXieUM6NbrKDBSQ3Ybin9tpLqdeRi
	OikS8zx0YlHfgVkXGBs+8OlruXPOdjaTVw2E1d4SnGRRiP6vk3D3WaJbHu51tIgB+TwG08yLbQF
	7ZyZlAyE+zvPHKSkArRiHIugKIQyTyuDY+9pDiLx/ZTOMlDcH8NYBLxKO6ClOyO4YkdyrK1HeJJ
	aFUImtQLOszvLB7oaJhT1XbpEl1i2+IcgVv/Kxv4ImEzxLpAL7VRlmW2mkv71OFYHxavbSzzm9C
	6XzmA=
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr1277043685a.1.1773671744727;
        Mon, 16 Mar 2026 07:35:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:8cd:b2ce:b746 with SMTP id af79cd13be357-8cdb5a1caa9mr1277040185a.1.1773671744347;
        Mon, 16 Mar 2026 07:35:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c15sm3385319e87.17.2026.03.16.07.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:35:43 -0700 (PDT)
Message-ID: <aa5af5d5-4ca8-4391-9602-23e1667c2704@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:35:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
 <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
 <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6gxzcgwzvqoaqgynwnturjybanjrk2jmmsa3qh3r7vafyyzj44@dfzkd3vigluu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExMCBTYWx0ZWRfX8Cc1unf2v0gs
 ddsIkXSa+fNp+eEe222G76gdPOgXkKyxdWifwij4KJ9kjAdzZgL/fuclWa5Xw6TqMXT7fRU0r37
 lbErdTsPAfnenyE1RC60HsB9Ljn15grLGQ+g8lZbLFjK09aRl4IOzx57IGW0dny5uF7agCvJNLa
 AA8ncWi2ObjRmZvbh0f0TdrHN+PIopx+tAe9mwGJZwtDV5cuJWoplQmMR+Sb7wvs25ZF9y5lO4L
 RRJa7d5I12hYnB9H1Rg98qjboYisYNDFbAB0wPBFgerE2ZWrEAj1GxAMK1wax73SkoCal5uFbW0
 TlSSX1ROXrM5JUQEEMPdDQRL6HDaWHwyoY2/qBfQ2lyomtzDz7DJ+1d41t+eS4XRWz5y/esel1k
 OTeNJ9ay9g4tK8DD5b7KdXgLBKTEUe47q6EvUuJPlBC+vq9sQ3d3Jp3HSG0GpXWUv/dthc2cXTU
 RYCo0jboureLUfOUqzQ==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b81541 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Dg97ds3F-sJKPeOKljEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aYxMsdWgSfTxu8IRSXYM-rK4AyUF55o1
X-Proofpoint-GUID: aYxMsdWgSfTxu8IRSXYM-rK4AyUF55o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[pm.me,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C78F829B7C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 3:28 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 10:22:44AM +0100, Konrad Dybcio wrote:
>> On 3/14/26 5:14 AM, Alexander Koskovich wrote:
>>> Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
>>> GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
>>> to family >= ADRENO_6XX_GEN4.
>>>
>>> This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
>>> an incorrect GMEM_BASE which results in severe rendering corruption.
>>>
>>> Update check to also include ADRENO_6XX_GEN3 to fix A650.
>>>
>>> Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
>>
>> Hm, that commit also changed the value for A730 - Akhil/Rob, should
>> that be changed back?
> 
> I'd say, I'm also surprised about something being broken for A650. Which
> path / stack uses this value?

mesa

Konrad

