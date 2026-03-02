Return-Path: <linux-arm-msm+bounces-94911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE5YGzmGpWn4DAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:44:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4511D8EFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A93DF31055A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13343373BEB;
	Mon,  2 Mar 2026 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mndi4cHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONDfX7eb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE2637105D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455081; cv=none; b=n0zFzsH3t5+wwRDsf2sQ7PC4TzEdb0zRYbQ0WQo+JHN6/9/yQdyhul9+TqdNLnvcXl5JcE7bMT2l4BmgFMecmHhnnLFpJ+EF3RYdDYbWgdWr7cn63oL3BOn/QJ3gynNkgOpROhQ9MgddXrTNHdw4BX3O7MDtvrXwxuyeExIHkzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455081; c=relaxed/simple;
	bh=YVI+Ln65GjYjaJ1plrCII2MWyJraZELVZCcw4t2+WIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSAJQ9Rbz96NzPlkWElWbt5h1YvfssYCnzZdByh6FAHgM8gfjgTDHBUAa+dgIr9qFe7HDWhmq/mcY04qvzcPaWGSPkBsvvfedv9SnjoZJJNMrnya3np5zxQC3jrNSh4mkAim/GwQWDo7k56deCZldFPKxflxBRkwj9xA4FIfjg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mndi4cHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONDfX7eb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B4Qim3561999
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=; b=Mndi4cHOsnQp2QMx
	sS5oQUtXOOLsfU0Zi4cS2sjaSMtXS16OgvGYsrAFyo2Wg4g1SouwiaB03EgST6zN
	8+9R0OF+GucZx5YGAjj7mG+mM5ZEaw5VYGvdjl+tNJYjHapZ+Dqa+L1ImJZHYo8c
	7Ab//dwpLglBG2oALJzeJUNVjutvLPy9SY9nGavJ2TU6y1hmb+K8OAD32VkiX1q6
	4QjBuJPyXbjVkWfNDTM++iiMy3KQnDu6I0l8K9pYlI3B6i2l+pYxamozCy84kbd3
	P9CGJrmWy73vxvlywqaitqr3EKVRyzgwyL8+lnAS8+mg1Y/DNT4hXVhDe6LKXCTg
	gsiEfQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv88w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:37:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50698374e33so48049221cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455078; x=1773059878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=;
        b=ONDfX7ebZrsg8fpUIuTcy1PRzX8DDSGtz985g9mGJaq4H/k7S2Wkp5DirZbPQJbJmL
         MegXifW3bXdXXIAlCzC61XJ5MAfjpDGBdCdjHfKGKoShef0g3vw1hjsoNxwINSNYMUSI
         ZEmT0TC1TE3WkEhQM+S3vc52JrCruLbqVquutm1Z16T4Nv48oF7R5Fd9wMBc4I6HdCAe
         vmF+GfxurWtu0semZSk9f5kR1ctXupuwQxXgyARlvbTc4QKfhiuyuXXGyuFcuVLfWwYI
         1dtBr0DW/t1IHmomOechDxI/5aYDb0ENI47ueCL1qXTjgZCOO1aeBPdcDhZbvugCytcg
         R/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455078; x=1773059878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xj+RXedbXE9FhFvC6sdIgsQRafMTshNF24rbEDu3JPo=;
        b=Z2SGG6+AQycg5vzKrBoCao/KFnAJ2+GhsDIKG7MwgZ1F6wizS1gPiB6rOk6/8AoY2G
         9hGXlyI4I91FAQ6E0Jj6GWBMpAouJPSZqQjvvHAiwuMl+55fRmrVBp8TLd9Ncz39U3Tf
         V1dqMhAQovOPK8QVPgBLHhdvkSKTjQGZWXbfLm7Fzk+hgwRd8x2Z3U9MvESykJqufMK+
         zRPaAo237ompqt63glZXuWPpCLjJzYG0SRI9hWHH7QNINJ35V7t+LFBvb/WaRg5zYEF0
         DO01FbY0PISKu/jQEDcudNjthJfrpu6BL8zbzCdUyECHIRKSetMGiXIdfVaHUaLM7SN1
         5Tyw==
X-Gm-Message-State: AOJu0Ywai9BbIrBrQ33mwCzWflmtnEmn148pdDrfFPcuRoiRKejPujh7
	UuGEOwspRRVXNwQa4jkPuwo7MoHdJxElWEdB3G8rZCWVqylH3GxytilPYm6lr6yihPeGH9MWwJn
	zr93yj9FZgD3LngsfFjyJvxUy5MWPskGOIdZoIKXlsTWb1MA4FZBFr9waIY2YncQOjzV+
X-Gm-Gg: ATEYQzw/axfhZeC11s+2x/1Yx8I3doY3OkeZ9Ejjym4wF5P8mRnat9KmUz+iSF6OX6J
	wBlGtz6SgoAd3Lei8Q2L8cB8LFXTPnhQMA7JeR64e3fxdbgIBOpp7/YRKC/Byg+Ie4iv21vsp81
	r2r21zikDGJkrS8vvuR+taHIzPm9rWmIbMYDmC+dJP0T+vGag0/M2FYBLYKF1Msi2FqbTTrmB0q
	Kmh+PXjJ+KZCHNyxiMTr5D4N3U30b4RRxD0S73lUnTp8DEFdY3bJ84+ky9okj3dtuhPXqhqOLeM
	s+i5//pROe0b0EN3A7NerhnU839W0V+sb9jT6sjNPrmOhtltEE51/k+DBgv8zxjSfkTk4ZKPFfD
	scRGmmZAxcMLJEN4psc5IxHPFL0Xl7SYNHTk4ahAsv7sjlaiDYulaBK+nTHxqGD2qvee076ffb6
	VHbuc=
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1245823585a.2.1772455078153;
        Mon, 02 Mar 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cbc8e44e19mr1245820085a.2.1772455077605;
        Mon, 02 Mar 2026 04:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36219sm3161313a12.3.2026.03.02.04.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:37:57 -0800 (PST)
Message-ID: <f04855c4-50e7-4366-a85f-d676b9f0ca07@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/dpu: drop VBIF_NRT handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yYORvzpG5Xtlc1VcBIc2O9y7Br7c_PRX
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a584a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5umUYrs0ihikrlwyJ8oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yYORvzpG5Xtlc1VcBIc2O9y7Br7c_PRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX+7+1dkyzrGDE
 mhzekS3jdBBap1q1cV1Nfmr5/jEBkvMP5pOfnysSehclPwTTlXL0UvSKezZEmYXKxh0NFApXeSW
 f7zd0nsnDEjQ3rkfc33jVs5TsxFfgq+h0F+xRrOSSEJkZwFkh1hSRjyZNaIWmQ1YvZyAW/SH5hN
 /2VOZSxNRqPJbPcBJZrSdCiCQSkcl0vOOG/MsZ60I/YZ1a9ohROvT3s/J2d7AZMRtnb0+p/bPC1
 QMcFilPzCg1GcJoTLGtQsqLQWr8Znl/64Mv68O150Cm43wSvgdNS1EQu8dsFv89lPFBZoP+R7ZS
 UNRc5jvZpcgTvsx/tgD5JcNFw30++zxit/iGQyWcorxFLPgNPFa3gFqlxcYQ6liRYVo2wMi1+Kv
 yoxoRFW0yVteRK6cbkEyhuiDPAGp9Mma8Mr2faLEDoOrKGaecaP1NbXKMwUyFpjpv5YpYZjvgGU
 KM9tabX8+di/WE0JvGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC4511D8EFA
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> The second VBIF instance, VBIF_NRT, is only used for the separate inline
> rotator block. It is unsupported by the DPU driver and will require a
> separate driver (or separate instance of the DPU device).
> 
> The only possible user of VBIF_NRT is writeback on MSM8996, however
> writeback on that platform is currently unsupported and it's not worth
> keeping extra complexity for the sake of that single legacy platform.
> 
> None of the hardware catalogs entries actually declare VBIF_NRT, so it
> is left in its default state.
> 
> Stop pretending that DPU driver cares about VBIF_NRT and drop it.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

