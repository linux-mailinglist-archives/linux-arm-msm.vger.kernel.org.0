Return-Path: <linux-arm-msm+bounces-86450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E172CDB0D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3500C300760B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE49256C8B;
	Wed, 24 Dec 2025 01:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeY3+F9c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCtjoDno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB026A1B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538735; cv=none; b=tXqwzEP3YLp4m4lM1rg1phaHv/saLR+CW10dvfRXvPViG/tQ44Q/tN9/bmvhrMsRi/2uVRjMZac+IUAzu0L5Zz9idMD3ATrEwSQMC1QZKb92o2U2dQdBQdRAEdcT439I95dpHtZ7Y4920BVtA32bPLxS1bWQhuCBmJcLSUSgrjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538735; c=relaxed/simple;
	bh=nxgSG18DrGDuC3R4yuOZSyEx86/vqH54re/9ZvYHNeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F47H9NqgLimRI8ytSPS50HQC/3O57tjObmrSSdaYIF8X8SF/rtkx3TRcGgB6RSwhJTFRC3Zxm6IesIlOoU8DTP6cb2h0fFfI2Y9kNJ+NEQJoqMrDHllMkhahyTDBtkCojiC0WRG7fafw/wbuAQ9jFXJ2y/92MNojJMD02mVusaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeY3+F9c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCtjoDno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrc8C678243
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YXuhZkCXgoOIEur3KF+80czd
	tsFOs/7rJU6d1bOIu0o=; b=SeY3+F9cH+rD4m4rxdQTI9vpb5+PpRMC2wMxIhSo
	4CJJBlgox3EzksK393Jk4/6WHnCj8/8Hy4KnfbY5luu3kznnZ1YWeBFZWQk1anc0
	2D9IbrKm/3o1wH1unHepQK5DQxp54a75rhoYykaH35R3uFc+XYwxCzy9AY9zukS4
	IEib33rN/H7YOmhNhBQfGbtJMB4ECCcX/d8d86jsnAYLfkbOrIMiObRr76YD5VpC
	a4vWRJe5h0ys+SgnT8PfmZRHbPyi5ZwlD3IjVC4SAQgxKRcLgNMzKpCOrnjFWNcp
	Pf+AwczAtpV/sTLvBFo/C1gSZ5eGCAT9yVrleChnHR20+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq11tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:12:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so60306671cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538732; x=1767143532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXuhZkCXgoOIEur3KF+80czdtsFOs/7rJU6d1bOIu0o=;
        b=cCtjoDnoeueSvPlkKJ9Vu0GCOBHC3O5lD/lSMecoiQ+pln7CiU0Xegqm1Vq+wweKT3
         4OqQNhZ70HojCdwJ4RLOOdZ4nvoVJFVsh57iF8TRt2WkfLh2Ww1C/TCANhqgxCx3uWS4
         ujuLslXgAp5Z0vTfMBSsTyXDBZBvnFQs6Dev30ni4HExkWdgtSC0bBtxbByyZvBHp8WE
         f5CGbJdofX+f1AEw5EhaIDSblw9xgVKkSCzJnDrSmlbSogd2pzGr+Z2ebtcWWHyBwLH1
         GlCtkDTfwPBlf74USfkoimPunOSY4WS8pTSNUErarzMO6JJ0cSpdODIznHAz3nPSGTWZ
         bI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538732; x=1767143532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXuhZkCXgoOIEur3KF+80czdtsFOs/7rJU6d1bOIu0o=;
        b=q0XnQHkpdlN4Cpv5NmumTJ3QVDM4CUwKlAQ281Yr0O04hgOjjo6rKFV8crYjjcSAop
         RwccQOm9y1+ov6q9rGHmxPj6FxhSGG2GdmoM9OCH7D3NGdAUf+lRStcZfT3un6mBpzVP
         kiiQ1ReJi2nUkyoCNUesFQaSEjDNbVX+3N9nPbyebxV9x6fNMJlSYLr+p8ViMZH56zDR
         P9Ne6xKV0/Ygtkz6x6nhEjjTJWIdxg5H63YxqbT4nhHn5zI6MCwHCTCSWhi7GSwFuhAG
         AhvvBbcnonoNfEUkui+Z4yBd4foJAuj2IOXMn7gQkIq5R08YV94aMP5opP+Lychx6DL/
         9ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCU6N/966UNqY1Oed/R6QPOCv+UsFSnU1iXuYP0PVW+ENqbpYlHQaX3/L+4BrHr7VNJ1L2jxleYS1/4OokLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yiQCnK5Jq9j42An85CMVZtaxmIj755pq2FeL5ocGFjtezBiI
	99yUppPem6jKpX1TO9lclC45NU/XjgB6TvKVr9+TSJNkiAuOt5kAIiRchnSKSKfzWSIJSlME5v9
	L040BJXZSPCZt1OoTsaQSqZ94OLq2TSujTG1cX/gfjb/MukgSN+NXhl6Xza0j5Ty+eapx
X-Gm-Gg: AY/fxX6OhTsMTOVr4lUjKxc63cqhPADm6+VIMTQXPYH454YN0S1oFRvwN3PtSOTwb0c
	qH0sg2Ekb2HW0j03w54uHMDbgzI//i8LZKuJ9X+LNcJAE2hukLSRALanS1g8oIRcQrl2uzDj0h4
	j9Nals7WV3Nv1jGQGDBJgJ41zXO6U5SLp8cb1Rr4l7MFtpEkIzTjKEXDz5Cp3Q7rpdxVZx9PESy
	5975OawWo/Tk4Re9uaErMiFDO4VzPkQADFEQ/+1Ul7dc0AR9swCgSzXb+BivSjR3rwKR5Z0BZmB
	7OijWB21A0ghKMaUMrLwYuvdk3ZktoHAinJu6cd3XOULBt2RN9r7zeuFLk8cLOIkSBCrirx9cu5
	EPEkVQnKfwCp34wGnvfzHq8dLt2/Ulejeg1m+Vy+h/EZ8h3dw3UV70uWMDFCA8aMml7lDzZWUIS
	83G85ncmtc6cD7dqjOfxOYpv0=
X-Received: by 2002:a05:622a:4108:b0:4eb:a3fb:2864 with SMTP id d75a77b69052e-4f4abdb452emr236091731cf.69.1766538732559;
        Tue, 23 Dec 2025 17:12:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiIEwoAJycDNPNnrRQ2r9Fdhu/zOetRe43PPfWrkAnUXdp8EiynL1H09rqeLnPzb9P/WXeoQ==
X-Received: by 2002:a05:622a:4108:b0:4eb:a3fb:2864 with SMTP id d75a77b69052e-4f4abdb452emr236091351cf.69.1766538732093;
        Tue, 23 Dec 2025 17:12:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18620305sm4515497e87.79.2025.12.23.17.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:12:10 -0800 (PST)
Date: Wed, 24 Dec 2025 03:12:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Casey Connolly <casey.connolly@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 03/11] drm/panel: Add LGD LH599QH3-EDB1 panel driver
 for Sony Xperia XZ3
Message-ID: <xqdy7sdfuptx7dyr6arhqna4pi5is6ivbuqhw7lun7j2g37xqo@iqdc2s2njjnr>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-3-82a87465d163@somainline.org>
X-Proofpoint-ORIG-GUID: tGFSkiRTXdx_qyyR3mLHRmkGOKg1Vh0d
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b3ded cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=QdKhUILdeOfo3pfzIQcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: tGFSkiRTXdx_qyyR3mLHRmkGOKg1Vh0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwOCBTYWx0ZWRfX3cCeXiKRp7pc
 t+aBg/xQDI8nBekT2HLhfzCFVqHoEkpo1Zf/YZS+HIdmcHyMw7o8sIzyAABCA5gWgzTeomq5en+
 aot1tRwf/wasJH3XGa0Ly11v/wzuKKV7CdPDmi8ArlSq593MvJjtlo09ASUVeVD2jcDKM7kzXHv
 Qd9nrSorCBRDPNvvagVJj9gG5kMNRB6oSSY+q2OHHeeII8Ja/3dtvF3UbGXB0ftYa8pjKyr2cxd
 wWO1VwjIAkLCoAuPQn2bI76CWL9OkML4ehH9PmD3umxRgUix2KEkzvjte6R3DIVzmOqbj1yVgHe
 6yGgND0UcB1p71fGzwVYktbm/Ku5hPhHp5oPSBc55xrG+ZCaHBbTDETtpscHmV7n2X2VilKJnM6
 p/FSW6txW7uFNpvfdPGXh5cZEXc3qXwv196vXLmKzhvfM2PQOu47McamX+DD5nG/s6k53b9Rzae
 gIMghtzaiun5yTiKDQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240008

On Mon, Dec 22, 2025 at 12:32:09AM +0100, Marijn Suijten wrote:
> Sony provides an LGD LH599QH3-EDB1 panel + Atmel maXTouch assembly in
> its Xperia XZ3 (tama akatsuki) phone, with custom DCS commands to match.
> 
> The panel is 1440x2880 pixels and runs at 60Hz.  It requires Display
> Stream Compression 1.1 to be driven at that mode.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  MAINTAINERS                                     |   1 +
>  drivers/gpu/drm/panel/Kconfig                   |  16 ++
>  drivers/gpu/drm/panel/Makefile                  |   1 +
>  drivers/gpu/drm/panel/panel-lgd-lh599qh3-edb1.c | 340 ++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

