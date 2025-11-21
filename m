Return-Path: <linux-arm-msm+bounces-82842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D039C7903C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 051992DAA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558EE27587D;
	Fri, 21 Nov 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMgMLBiG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxG5ncu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147B1E0DE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727730; cv=none; b=H5Vt89m0iKk22gnH67kDua7W+krXsyqr+ojFHi/qHDMaaWDs+3iOpcH/+eu6q41jDP701VWIcc0dQ48oBK+4/GCs+N3ZRoY1VodpiTa2m5pDo+O5gsTKS4xCFHHkB3pWXxMhwInIXNaPohKm5WWbMF3d/lWSVWPIoR+nVPhqQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727730; c=relaxed/simple;
	bh=a0og27g4FEXF5qVbJXNaqHgTmGNp/nva+ehekdAGa/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyJcmFw2w10JNRsdq3KEvHKtXaNWcR1SjxtE2DXYv6iGI2tHskzpoVAik0E9a1nFVGDzjcDvZG4e1EPiUCxsbKj7sfvIpYcYyZonxyS7hK9EcLDefZFwBF0F6OEN9wPBWD6OP39jDnPWQ5HXAeWklNVJEF26NY4OfosahRfme9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMgMLBiG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxG5ncu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5TFR12831852
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QOIEJ6UPJQTAjE0lnDBx83Mc
	3Buu9GbdeLLWEnEH4nU=; b=bMgMLBiG6TE8VU7bV0s3zcnva72tTZP5o5jByY2P
	hDsrlAJJZslq0/LSQMtd+ZE77MTzueZW7HZP0S9vMvuoYHqSWs/7qDDXPfcK9j/V
	sOBqQRgnm+yMJpmmuwxav7DABYBjVoV4i1wD4lZrN5eXCjlS/3OXqb7E3GApskiQ
	Hyn2gWZQcDRgucrM2r00tZbduoHtlOqs0wunxVIQ/9F3azclPiu5qVn742LhNrNO
	SiksynewmKLKI58QUE36Kwp8ed5YABuTdTPExzHA/aewbpSccAr87nRiCjypQcEf
	2i/kJT2zn2/Yyq2eobild50f4hLltfEflEiMl1lgbnYvOA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhyq1br3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:22:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f8a2ba9eso50119745ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763727727; x=1764332527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOIEJ6UPJQTAjE0lnDBx83Mc3Buu9GbdeLLWEnEH4nU=;
        b=cxG5ncu+q8VbPW1xcuMMDWfDp5rO+Cubt39kQaU0svEAs4ST8RmbQ81sgensAeZOBu
         /+by+UdX2euNzioM09xOYiiHlQXEoWfS2rLsBcgMf0FPtB/UZlsV/oCiuG0CxkHYnf8M
         dSOGKcNjyEEBCNEjsXFagoBZGeEaXXEtKoazkHi3ekIKZSfJdaUGZdep8CT0xfPYNVrD
         q0NwQpLOEnSExECxo/wsJHP18z7MCpk2hvKxth9EL7k1Foi45QF+gXwYTROlACcLgQl8
         UXWfql5k7HwEliStzdfpc5f5CoaIgni0ru86nG5VjqTMU2Ar1BA/tlfzMXPEAHgKGaI2
         tifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727727; x=1764332527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOIEJ6UPJQTAjE0lnDBx83Mc3Buu9GbdeLLWEnEH4nU=;
        b=CrmXprwu6ld4QbcPRIYQUE+aFsCeTi9iT773gcOrDNH83zKnPk6YVJjLgXRLElUFOf
         68v9Gbsr7MOAkzOWmGQDN6xCjq5MLseofJPjr2H5HBY4EMEGcjDCJQsXSS6B+U3iaNw2
         npin9t+JzvDlxspSe4tYrkquM5GjnICT7dY/aRXn+D55GJkqN7ZEX9EQOpQZxm3EOYLF
         77vxj4lfw0M89ovx77F/XD1jKoSDwRJEVrRsXRUsLuP+Z+jVOwMGeltObuv6BmkcTz8v
         hc0/5xpbNjqVWufZ/ERcq2nMDjh1UO1epMXwujA4p/vUJLoUGVQr/OEgc+HALcX68+1v
         RXQg==
X-Forwarded-Encrypted: i=1; AJvYcCU4K4uYd4x5bk+iM2fqZnle3B73S4ywEusUCsYvZfzg0D0ezFg4f8zEkKGGy3paqLh2z2TCb4uy8oz8WDpg@vger.kernel.org
X-Gm-Message-State: AOJu0YxK39K513bw88dMKlw0c1N7w8i+aFYNws3aEId/lH602TqtLAeG
	CF14qQkck7mwuAAlRRCV0xUk3ZBVIKM9BB4SDPLWvAzdiRBlUSeOH6WXlWU/UensKzi2ApWET81
	Hw64bxBbaf7dceWW4Ze0+x0sqsICdLbrjNRUdyGM1ivJWtUVmgD+iMMzz24TqDn7YEUl+
X-Gm-Gg: ASbGncvK2qX3MPguBH86GNLlBDx3RprC7+cLbMXv0nb4oHoxi43LKvMChR25kiyes74
	Gnw32rtFVZDBZ/+8NhG8b9IPwxVkwieP6ZLUq2PlGQFm6TwZ4vSUu2BEakzw01NaAdNS2B/VtTT
	v3Bx4BlJMf0GYoz8F8Ljlxg8sZfyKNqLGrBWrn8Njl6Cg9E3MOWXlL0yQxEXnI4MoiTzT8yLFSG
	gM2KqZCwdKRNl3Dc85V7LAm4ZUoUb14nukmmTMZNB6wPTk72e8T0ew5Z7mwRqrkvXN6aRvJqRQj
	Ge9S3/jd6DAVJEf/tFcufhO5AyW3jdCeHSuUzJ1xSRBLX2gAD5gWNzcrIaXRYkRHRmdje9nJJoG
	dDvyoUL2QnT8pnWm1E0JtRFpeaa6pbVFMgTWUgoMRJAfIfgM=
X-Received: by 2002:a17:902:ebca:b0:295:20b8:e104 with SMTP id d9443c01a7336-29b6bfb2dbfmr24170375ad.58.1763727727151;
        Fri, 21 Nov 2025 04:22:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvJoin87WK7edXgGLBHv6hcpFfAb7pDIOGdRzPQZ86Ke8psodEKElFccqt9If6oIGCW2Nm6g==
X-Received: by 2002:a17:902:ebca:b0:295:20b8:e104 with SMTP id d9443c01a7336-29b6bfb2dbfmr24170135ad.58.1763727726625;
        Fri, 21 Nov 2025 04:22:06 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e8b37f1sm5520188a12.14.2025.11.21.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:22:06 -0800 (PST)
Date: Fri, 21 Nov 2025 17:52:02 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ice: Set ICE clk to turbo on probe
Message-ID: <aSBZanJz5V86cyIZ@hu-arakshit-hyd.qualcomm.com>
References: <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com>
 <ofxrykxcywloaajt6sv6nb7shfmdlips4tezrimiycsis4vamb@thkoqsdwynie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ofxrykxcywloaajt6sv6nb7shfmdlips4tezrimiycsis4vamb@thkoqsdwynie>
X-Proofpoint-GUID: 6HUoKJoMTbruMQki73VGEB4EhWS_DnGI
X-Proofpoint-ORIG-GUID: 6HUoKJoMTbruMQki73VGEB4EhWS_DnGI
X-Authority-Analysis: v=2.4 cv=N94k1m9B c=1 sm=1 tr=0 ts=6920596f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ciROkYvXyXDSqN8Q_VUA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MyBTYWx0ZWRfX0ZB1xs/U3Q4A
 zf5VSDgB3vnl2VEOYgwj8bRuRXx2ztu7HH6iEnJVC7QOVrA23BvxRBYHvoBgz5mN9PHQWMwYjZZ
 PoDWL0cciuIJRUIm9BmGAkN7j3HfvwOZDN0VbFnqKqVIk3cAbaAQxpgrOjiBv3XYOVIXqTWTMj3
 HtXcQtUnBBtrRQKY51TfIPp75GFF2IqOsvtNexdK6UgfdpzwYh3N73baRsMOoAqdHAI1V5Al7f9
 bodLlpaUn/YvkKw39mUBs1nAFqTeRnSpdf2j7BIyqg+3H+6i7/GGiZOpqowC1uMnVVxXNCQgdmG
 NlHtk3VlvMWlggspm898TU6fQ5prVmMeWJrg05P2tyLt5zOT1uM99oPkVsn4xb5qlHsI2IZilC6
 6HYfx1c/TRPD1xIKd9ssTlJxuwpIig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210093

On Thu, Nov 20, 2025 at 07:42:24AM -0600, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 05:44:32PM +0530, Abhinaba Rakshit wrote:
> > Set ICE core clock to turbo (max freq) provided by dt
> > entry at ice device probe.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> 
> Didn't realize until your two patch series ended up next to each other in
> my inbox, but adding this support for UFS and for MMC are very much
> related, so please include all three patches in the same v2.
> 

Sure, that makes sense.
Posted the patchset-v2 combined all three patches.
https://lore.kernel.org/all/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com/

> Thanks,
> Bjorn
> 
> > ---
> > MMC controller lacks a clock scaling mechanism, unlike the UFS
> > controller. By default, the MMC controller is set to TURBO mode
> > during probe, but the ICE clock remains at XO frequency,
> > leading to read/write performance degradation on eMMC.
> > 
> > To address this, set the ICE clock to TURBO during probe to
> > align it with the controller clock. This ensures consistent
> > performance and avoids mismatches between the controller
> > and ICE clock frequencies.
> > ---
> >  drivers/soc/qcom/ice.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index ec8d6bb9f426deee1038616282176bfc8e5b9ec1..eee06c499dc36a6bf380361f27e938331f1fcb10 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -535,6 +535,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	struct qcom_ice *engine;
> >  	const __be32 *prop;
> >  	int len;
> > +	int err;
> >  
> >  	if (!qcom_scm_is_available())
> >  		return ERR_PTR(-EPROBE_DEFER);
> > @@ -577,6 +578,13 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >  	if (!qcom_ice_check_supported(engine))
> >  		return ERR_PTR(-EOPNOTSUPP);
> >  
> > +	/* Set the ICE clk rate to TURBO */
> > +	if (engine->core_clk && engine->max_freq) {
> > +		err = clk_set_rate(engine->core_clk, engine->max_freq);
> > +		if (err)
> > +			dev_err(dev, "Failed setting the clk to TURBO\n");
> > +	}
> > +
> >  	dev_dbg(dev, "Registered Qualcomm Inline Crypto Engine\n");
> >  
> >  	return engine;
> > 
> > ---
> > base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
> > change-id: 20251001-set-ice-clock-to-turbo-ecab9ea46a89
> > prerequisite-change-id: 20251001-enable-ufs-ice-clock-scaling-9c55598295f6:v1
> > prerequisite-patch-id: d66f521e5e625b295a1c408cdfce9bd9524ae3ba
> > prerequisite-patch-id: 23934f3fee5aabe4a2324130ed02909352b5cf61
> > 
> > Best regards,
> > -- 
> > Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > 

