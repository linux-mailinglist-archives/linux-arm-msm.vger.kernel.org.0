Return-Path: <linux-arm-msm+bounces-82654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD873C7369C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D340C348228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0361311963;
	Thu, 20 Nov 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUPbCdKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhjtB9YJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2A2727E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633438; cv=none; b=Ndr6GWEI3tng7gvC4dn8golT1nx5W8DOx/a4OMc4jiaYjIFnyNrHvyDq5R7LeiPHZURPTjrbAUL4S4Bn2q8xmg5mCqQiQK0eMThNnpo9xVoI3F565eAS1Ic9agpRGpqI0in1+XwcNgvi9/HPRmCvEY3iBOVxxDqvTEiLkGfgZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633438; c=relaxed/simple;
	bh=OyZfVmG0raYOvMBF12VXC7cm2GCgMS+jOtMXRYSx6R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TciO+nYSFVRIoh/P52lF0pz2m/eGF2RCFH0YItkLbCb3HVlYbXR3Q58OdUxyog+j1nHwvQNGZGDHGQkChVqK65X6GElvywrumDEjdRGQ225Xpi6GuOL7xov+63xCNF/Fhejb0x+XXYh4aTzViKcP2pJDjUcIDUnThsM6fMuB7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUPbCdKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhjtB9YJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pd393543813
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=23cqg0loiit8wTW39VISfFQ4
	BP4oAi4cHh27I38AFLE=; b=SUPbCdKesvqaj54ZqI9nC623Lq7sUQAuWOC6y3rR
	nwWoaMsqHZAIxFlHVHkD2loN+eur7FN8HrO2tSwAjgW4jVMb3V4ihBOd55dgc7a7
	s1Y4x0BVWmXB7pSz8GYzNNM/5kbJuNO1ciEpG0mKxtDO4Y7vHuZi/+RbE00FLCW5
	/lf8kpSFx9PF1ILMDGbVt4jxtOPMciZ6Ci9c7m279HrjizsCrUIRBnpy1PMH/hoB
	Ys2Ak1rpBmvk0o0l2xhSCC66HJc3aGJDhipPR+I+OZFRSSieK3plrOAMPGHMOjEz
	nyy/A7jOzNebXuEzVLJ261LGMeL/CnwaoarfzVUKHF1cMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t2y95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 10:10:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297dde580c8so29576895ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 02:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763633435; x=1764238235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23cqg0loiit8wTW39VISfFQ4BP4oAi4cHh27I38AFLE=;
        b=YhjtB9YJ5Qsy6N+v6cbRykAXltn6ORjTTXqrGhZSu3gf38GvMrpOtOn9MJAuldrVSj
         rxiVCVnA0I0JTpbEb5+7mlFu/XAjJheELuKt+CAvSrStZOefmPQNo5sc/YORh7RKeW/A
         a9hoVuUSxKQl5M2BogABvcy6mkvxG+SORIOQWo91hk7iLQmroQP02VDJB6mOJc8fkFfk
         D8pEewQH1Ryz3GuhffokvYhVVotRaNGBk65k5uOUDF9OR2slG0SDndNlKjMLo7H6is8/
         1GdsLaMuFe/GqYwfwCKZvE+rir6wj2lx5rs8ATd13ixHQbnbFF9uxpcfC7kMwraPjZ8Q
         xyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633435; x=1764238235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23cqg0loiit8wTW39VISfFQ4BP4oAi4cHh27I38AFLE=;
        b=tmeWjmmu38SFEaElvEGWJpuXvpUugoHl5FvpNhXwzpnz71AhfwGef4PDki2x6SJa37
         FeFon/gTCRjrwZiOjZyEEW5s8CCH3o5v70yN0a++/AzuUhdzO0eRf52hFAV4vpV2xPdJ
         ovzZFWq2zLBSE0/DujIxNlpVBlibWh7mTsP7CtdZrNmZtdzEBYiRipaWPN0ZwQ1mIKzN
         W1nAWJBwnGp4qmpL5Zo03ElmoTQLxy8MIqf7EaO2z2BR9VywptiQHdw4672W/EUAhZsf
         kpEgcTk49mBSRAfKku3Kj3LyLXF68MEw5Vq/ts+O3HSaKj9188yLUywfKFMxJPBnuvXO
         zOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAXQWxn9L+go+v4w2ETCRvHij3wt+/LWklV9S4yQYDEqZzdqpEUxwaNT86XLF7JtUA+ffgnhmHvIbKRBJI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9gavyfM9Fppydi3e778uMBoUiMmNF9FTWysKCx27TiWS+H1c
	D7+e1qPnldodojZxXiCEiADfyDEJkWLohcGH7TCzW4/OvoUThnABoqenH28gCRUZswxuMahTTeF
	+Q0WDzK5FUmO3TfKk257i1q4V8k/C7AfHUHuPHaFJIYxRrzXdnhm8I50unC7VSXbiLn6k
X-Gm-Gg: ASbGncspAByWv0W1rB5KZvuiDfcozctM6Y0FPQHFpOCZeAdIrNpOjr7z2F0aJlA9Cro
	RtSns4Qtidzm6vB8yDgbuUDQYoahM/5fsLuFYcjDr8CoDt66r40tPfHL1kVT9Nk9PqcU1fLdC5F
	h0cvPTh4ic9TEne0YMxUX+K0Qe60x1HDLCC4KKUAROnVHL7A/NePH9FqBp5WmT5LTrH6nDAErfj
	4OxH9tGt1pkMUyDbWbZBPOJYW7jTYHkpcZWSvaUl5siBWc/bHXkgPAXFYq5L4xP2D7ABTSW7bOy
	8UHnLFAvQzueW+dHIr0YPANu9G+pa/OXWlyqS3NxwYEEcure1QCkwk6waeLBJ3Y0C1K/YNF46JT
	0WtkrV1nPR/XoWIg4hy/ysyrr1D5ZiwUHRPEWOEg0GxumHzI=
X-Received: by 2002:a17:902:d544:b0:29b:5c65:4531 with SMTP id d9443c01a7336-29b5c654627mr31208525ad.59.1763633435514;
        Thu, 20 Nov 2025 02:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWP4FnW1QIf5n0h8n+V592eiY/dCsne+EMlW+RUnc0PiqPyIi4xPBvqO3h+nAvNkuXaDx5oQ==
X-Received: by 2002:a17:902:d544:b0:29b:5c65:4531 with SMTP id d9443c01a7336-29b5c654627mr31208225ad.59.1763633435061;
        Thu, 20 Nov 2025 02:10:35 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e7e6sm21535785ad.40.2025.11.20.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:10:34 -0800 (PST)
Date: Thu, 20 Nov 2025 15:40:30 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: ice: enable ICE clock scaling API
Message-ID: <aR7pFhC5NlsfwLMG@hu-arakshit-hyd.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <6PNEPfyjHahJ_pLSaxMINWXDHyO3NKVQD8Bo6XXlA7yI8Qcgim3MDd4gFC8LIMYAIFoAIHnttsDVc6LFEdBWCg==@protonmail.internalid>
 <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
 <22a6cebc-bd09-48f5-a11e-ab925011bd8f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a6cebc-bd09-48f5-a11e-ab925011bd8f@kernel.org>
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ee91c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k58wtyJiP0ZlwjBnw7gA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: QNPSn3cYzid4LdT1j7JsVOJxT2G0sfms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MSBTYWx0ZWRfX9iH6EqL8H//P
 MZfZ4YRQduE6dggRvxqTbvwE76WsutfmlOX63NBW8JURd9PrqMKdKM+wL4KOaudBeszqzI4vjMB
 puSenEIbb1VIV2l+ywBOjS21c3TQApNpFB6wXEx7cn3ZLLKu0had0xbjTlJKyR4zsNM3LRIqZlg
 8ZWzMr9XCNModTpwhU2iP/cR3U31lZD3Cw5uQFrO+ypq4weOMGDnDNqwCcty4Lnp8pn2RwHYMv+
 /HUp4vDsFY5KtrzwofNNhhNIjn1cdyPryUh/EvkEdk6G+Iq4Pgu8xJVvfxXotoUExXhRgsCqxiY
 yF1Oxs8TboW+MaK+28CDetwS0cOz4AMVufiwdeVjaPibjxx4MseemcL6vbOCoi8RzfIp5UimBxj
 Dcrwfdcd4+pOmvTH8OtppJq4JpVl4w==
X-Proofpoint-ORIG-GUID: QNPSn3cYzid4LdT1j7JsVOJxT2G0sfms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200061

On Thu, Oct 02, 2025 at 01:21:22AM +0100, Bryan O'Donoghue wrote:
> On 01/10/2025 12:38, Abhinaba Rakshit wrote:
> > Add ICE clock scaling API based on the parsed clk supported
> > frequencies from dt entry.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >   drivers/soc/qcom/ice.c | 25 +++++++++++++++++++++++++
> >   include/soc/qcom/ice.h |  1 +
> >   2 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index c467b55b41744ebec0680f5112cc4bb1ba00c513..ec8d6bb9f426deee1038616282176bfc8e5b9ec1 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -97,6 +97,8 @@ struct qcom_ice {
> >   	struct clk *core_clk;
> >   	bool use_hwkm;
> >   	bool hwkm_init_complete;
> > +	u32 max_freq;
> > +	u32 min_freq;
> >   };
> > 
> >   static bool qcom_ice_check_supported(struct qcom_ice *ice)
> > @@ -514,10 +516,25 @@ int qcom_ice_import_key(struct qcom_ice *ice,
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_ice_import_key);
> > 
> > +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> > +{
> > +	int ret = 0;
> > +
> > +	if (scale_up && ice->max_freq)
> > +		ret = clk_set_rate(ice->core_clk, ice->max_freq);
> > +	else if (!scale_up && ice->min_freq)
> > +		ret = clk_set_rate(ice->core_clk, ice->min_freq);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> > +
> >   static struct qcom_ice *qcom_ice_create(struct device *dev,
> >   					void __iomem *base)
> >   {
> >   	struct qcom_ice *engine;
> > +	const __be32 *prop;
> > +	int len;
> > 
> >   	if (!qcom_scm_is_available())
> >   		return ERR_PTR(-EPROBE_DEFER);
> > @@ -549,6 +566,14 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >   	if (IS_ERR(engine->core_clk))
> >   		return ERR_CAST(engine->core_clk);
> > 
> > +	prop = of_get_property(dev->of_node, "freq-table-hz", &len);
> > +	if (!prop || len < 2 * sizeof(uint32_t)) {
> > +		dev_err(dev, "Freq-hz property not found or invalid length\n");
> 
> If this error really happened you should pus the result code up the call
> stack also since either case can be an error you can inform the user of
> which error happened in your output string.

Okay.
However, we will move to using OPP table and hence, this logic might change.

> 
> > +	} else {
> > +		engine->min_freq = be32_to_cpu(prop[0]);
> > +		engine->max_freq = be32_to_cpu(prop[1]);
> 
> You check for zero later on in the code but, is zero a valid value to be
> returned here ?
> 
> e.g. is it valid to specify "freq-table-hz" in your DT but then set max to
> zero ? min to zero ?
> 
> If not you may as well reject zero and dispense with the checks later on.

Yes, zero is valid here (means "no scaling"), will document it in patchset v2. 

> 
> > +	}
> > +
> >   	if (!qcom_ice_check_supported(engine))
> >   		return ERR_PTR(-EOPNOTSUPP);
> > 
> > diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> > index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..b701ec9e062f70152f6dea8bf6c4637ab6ef20f1 100644
> > --- a/include/soc/qcom/ice.h
> > +++ b/include/soc/qcom/ice.h
> > @@ -30,5 +30,6 @@ int qcom_ice_import_key(struct qcom_ice *ice,
> >   			const u8 *raw_key, size_t raw_key_size,
> >   			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
> >   struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> > +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up);
> > 
> >   #endif /* __QCOM_ICE_H__ */
> > 
> > --
> > 2.34.1
> > 
> > 
> 

