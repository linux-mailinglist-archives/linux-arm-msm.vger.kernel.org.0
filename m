Return-Path: <linux-arm-msm+bounces-90837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO6YI7LqeGmHtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:41:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516A97E04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFDB3300E3C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306FD360741;
	Tue, 27 Jan 2026 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fwe0qimC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1bJjdT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE434D4F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532078; cv=none; b=VA97T87oxdHwskw4MHirieu9Ok4EIp5fQXuVnRZ8KTFw4rJwf+Kf3FwBtGtqq8WHnnHDlvRHtqiRxWEywrAz1EGkRVVcKrj6eTV5cFIWwRP92jXe69DQTfkG6BIDIfbTulnsnwBwCbuBWVDuqdup4JVLIL2vsEmPuRml0yqvlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532078; c=relaxed/simple;
	bh=1mneCOaFxctoQw+LPAcGreUO0rUYcZrD3A6hmD9nUAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSWNMndAi5Csm53I5Kh8+yWt+X17p4E93aeSMYjQHhF49kX0ACTblwGbFFqknvZwEOwQ0/JB/jUMKQ6LoqkW2rRU9DLw6Jn3bkjiKUMFnY+l/HkY9NEQiU4EpiJ+Mbk1eQYE0bQ1CmJPOgICFeYRfO3AIcldfUVECEny3GRllMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fwe0qimC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1bJjdT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBwaTP1135805
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRqGbDGbZxo0LShDIbe7Xqb9UijmImY4bgm1efz6p7c=; b=Fwe0qimCHDeRw0ZH
	wnOGaxpSeB1oEi2t1XxFNZH4gHXyMBd3MJwSBcCiFh//FM8ZCjsgYjTSVtiDOaW2
	UyRZHz4A8gGkQLCxlcPy89ZHnVtwN7gZMW9YDgY2VsSFWAq79BUR2LCXvodAW7gN
	f81YhXmw5nuF6CacYXGHLA/Q/mwshNlYrlnteLZrA9SPBrON+MXri24CQkLymDYK
	VCe46pp7a3o7HVs0KdQ0L7kcaxFJ/tbNE4vmq+xhnF0ONunrZaAgEjaHK83IsouT
	zQpBBlsL9Z78kAQxiNpb3ikyKLtq0uX/W0bX+qK3m1cOJNYq7Tbxm4nqVwnEdQeI
	cl2Hwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjehp8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 16:41:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a7fb4421so1472505085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769532075; x=1770136875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YRqGbDGbZxo0LShDIbe7Xqb9UijmImY4bgm1efz6p7c=;
        b=K1bJjdT84wrKJ8/ISrCWEX/7Owk6KPpLcKlNOuiXi/30OnVn0Z2HAeYUwdb0LqoX3j
         JE9N6GtBpRUtrH9Ftp8RYclHkyofy4qQ448rZpZM6LHinKlzupmOZu5Iy+11qovhvZOv
         Izxx111Vg4fl1/qSomo0m3GzL980aLpmW7odfwKaUHzRspjVF54k8CJbC1DVaCPl1bG2
         xVyOLj9zSSoEUgQH1ud+bczgxSzNJYAZChM5hK9XNAqliyfOGQsyvBhs9+i4ktKFyRIt
         Y2tmx6rbxjkBWBwNk3KDBuYXAEZ4DvP83j1HIMDgqvDQjjQew0QwKnQSg0godm0BGlKe
         q/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532075; x=1770136875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRqGbDGbZxo0LShDIbe7Xqb9UijmImY4bgm1efz6p7c=;
        b=PiqpPcOXndMAAJTMfG/k92mGk5q7q7OSHLrkkW22i8qHmqSTorgxp7RnBs/S2u/ybN
         Zy1MOAHp+6oSC/S8uRKbCZIGoh7+iVTmUD4Si+O8F6Lwu2OZw/yMg+Pq6vUq5XMkvIQP
         a5jMr3+O/5AkN2xqWFCnTa4FxK+X5lnNq03TPeDXhbfPTL0rUNRIpVKUIGE4XmmQOiiF
         rWmNZSEDAmnmwrW8XMcnHuDIqY955fnP9INRvwYRwUGmSgy5QbpgQKXUuPF7Fdc4R0YC
         x3++nGtMsW4KZ84nZIHG90tHii2NhGMfw86RV62ndJm+9JzqLEoYqY4g4Okd6cQgwxj2
         FkNw==
X-Forwarded-Encrypted: i=1; AJvYcCUKuCcsDrDEdgEuoHXnMBldyg9NkI2Df+2X9qdfoMg/9UIqkfBVIQG/IdXYoWbDx2VvAbh5CjTbmVgCcQmP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKfUIp+1KNx115V1K/c4s9Q/XCJMLT12CEi6crLlZS1g8CbP2
	F4UvyrG/PjzXZMtIsOcsPuReDutWYcxsYTZ5/ygN8KAB1j68EfYVpBViMiW/Xnr/lXY4acPSFTU
	bwkortx4JwQ8kFbyQfbotH4ka4NIkwCbewGG3VNlMRzmT3Rx1X+bvHHU59/amqb6wfoF/
X-Gm-Gg: AZuq6aIujaqRierTTCWgSjUftvkkEk1gIt2tJf8Etm0vrRwa7lXuUz8GLfowogUNwjA
	BxlfEn6zgy17/YryC04Hv1XVI9bFDTOwmh3t6lkk5+fr0BNF6DvCE/mJPSUfLEcRIZiOo/2XoQs
	TKGYf/3YosoWiuD8caeyOutC8iH6e75Ro2iTzQKl+vGEFFo5C0JOh+RNAZWfBJc75nzf57iVuh4
	5A7i8vo3aIg6lOGeqT64bQ34WVYMi2XWFHVLWR9vbY2D1WhkQ4SrezqJvEWcBl3gk9qGOItFavb
	RfRm9SFuyg6aIotxL7TfJzjCok+12N60ZyXLQ+G5/E/4dG3n/fcQLvz9NWPzeTH0n4cCe1CG3IV
	dWHJJ3to8/LTJdu6xKCiGt4p00Ch0ok3PoynaC9h5f2TFckQnF2mRP0VyqKB+tpFXYsiTgv1jK4
	PYkSDF7qHdKdLk8eKPj2JCFho=
X-Received: by 2002:a05:620a:d96:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8c70b878bdfmr260098885a.37.1769532075286;
        Tue, 27 Jan 2026 08:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:d96:b0:8b2:f2c5:e7f6 with SMTP id af79cd13be357-8c70b878bdfmr260094085a.37.1769532074695;
        Tue, 27 Jan 2026 08:41:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fb17f5sm227771fa.41.2026.01.27.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:41:13 -0800 (PST)
Date: Tue, 27 Jan 2026 18:41:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
Message-ID: <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com>
 <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
 <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
 <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
 <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNiBTYWx0ZWRfX0fv3ZAtChxXH
 hdHPGsv1WyAmg7tTNB80pHS2A3iDEw1a5m3/bfUSlkwQl59l8wR4Q0f7dRBaPWiYVv6jOXXLTXA
 2XFN0+EMOab34eBTnFHiZv4bk5pdxaqEsdf9GJCg9evyGDug4xAlKFS1GPeQ2vXrSQSq39vKIA6
 5CJv05jcQCpJMWP5CbmEJArk7mxSohZ1fHEYtlF5h1zoHVDp5BLlXCZCjkGqsAhJcVJ4wUlUR64
 GEzhx9zwWnV7zqCA65503GkU3GBueXwoR6bZRow7w5g9Dwgs2QDJ7INFPzXC14bP6GaZ/0q+eBR
 kgh+ZXdfM9sk2J7btqTDwm9/dA5kg/8Uh44NNXlJECC4QZ7hPJxyuqVTCKp3fhJCE+plwylyy3W
 uu/L07b+11w+WjLV24gSPYq0yecXM7y7ZAeOT0vr1suz8mncamvUi2PH3NlP67WCsEmkDUPEcAd
 c8g0VA8lA2Hu9Y0umXQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978eaab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=gzopeeIKkwILEqGHztUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NOvFa3U5tihvsm30FwB5Wyh7VUYAAYk-
X-Proofpoint-GUID: NOvFa3U5tihvsm30FwB5Wyh7VUYAAYk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0516A97E04
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 09:42:10PM +0530, Gaurav Kohli wrote:
> 
> On 1/24/2026 12:33 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
> > > On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
> > > > On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
> > > > > On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
> > > > > > From: Casey Connolly <casey.connolly@linaro.org>
> > > > > > 
> > > > > > Generalise the qcom,bam-dmux child node support by probing all
> > > > > > remoteproc children with of_platform_populate(). This will be used to
> > > > > > enable support for devices which are best represented as
> > > > > > subnodes of the
> > > > > > remoteproc, such as those representing QMI clients.
> > > > > Please flip this around, start with the description of the problem
> > > > > you're trying to solve.
> > > > > 
> > > > > > Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> > > > > This must have your signed-off-by, where you certifies the origin of
> > > > > this patch.
> > > > > 
> > > > > > ---
> > > > > >    drivers/remoteproc/qcom_q6v5.c     | 4 ++++
> > > > > >    drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
> > > > > >    2 files changed, 4 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/remoteproc/qcom_q6v5.c
> > > > > > b/drivers/remoteproc/qcom_q6v5.c
> > > > > > index 58d5b85e58cd..a02839c7ed8c 100644
> > > > > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > > > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >     * Copyright (C) 2014 Sony Mobile Communications AB
> > > > > >     * Copyright (c) 2012-2013, The Linux Foundation. All rights
> > > > > > reserved.
> > > > > >     */
> > > > > > +#include <linux/of_platform.h>
> > > > > >    #include <linux/kernel.h>
> > > > > >    #include <linux/platform_device.h>
> > > > > >    #include <linux/interconnect.h>
> > > > > > @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> > > > > > struct platform_device *pdev,
> > > > > >            return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
> > > > > >                         "failed to acquire interconnect path\n");
> > > > > >    +    of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
> > > > > There are other child nodes here, in particular the GLINK and SMD edges.
> > > > > Do we really want platform_devices registered for them?
> > > > > 
> > > > > Regards,
> > > > > Bjorn
> > > > 
> > > > thanks for pointing this, can you please suggest the right approach.
> > > > 
> > > > This should not impact glink, as that is registering as rproc sub node,
> > > > And we need rproc cooling as child node
> > > > 
> > > > of remote proc subsytem to create probe dependency only.
> > > > 
> > > > 
> > > > Can we do platform populate for specific child, would that be right
> > > > approach. or we should create rproc cooling as independent of parent ?
> > > > 
> > > HI Bjorn,
> > > 
> > > I’d like to highlight the impact and details of placement of remoteproc
> > > cooling dt node:
> > > 
> > > 
> > > ->As a child of the remote proc subsystem node:
> > >      In this configuration, the cooling device will only be probed once the
> > > corresponding remote proc subsystem itself is probed.
> > > 
> > > ->Outside the remote proc subsystem, may be part of soc node:
> > >      In this setup, the cooling device will be probed independently. It will
> > > wait until the remoteproc subsystem is brought up
> > >      before completing cooling registration.
> > >      The drawback here is that if the parent remoteproc subsystem is
> > > disabled, the cooling device will still undergo an
> > >      unnecessary probe, even though it cannot be registered.
> > Bjorns question was different. It wasn't about pushing cooling device
> > outside of the remoteproc node. It is about not registering the devices.
> > 
> > Can we follow the approach outlined by qcom_add_smd_subdev() /
> > qcom_add_glink_subdev()?
> 
> 
> Hi Dmitry,
> 
> Thanks for the review. Since the remoteproc cooling is a QMI-based driver,
> it will receive the
> subsystem up notification directly. Therefore, there’s no need to make it a
> subdev node or
> tie it into the init/reset sequence of remoteproc subsytem.

But you've added a subnode for it (and we are discussing exactly
of_platform_populate()) call. So, you are tying it to the remoteproc
device lifecycle instead of the remoteproc subsys, which seems strange
to me. There is no cooling device if the DSP is not running.

-- 
With best wishes
Dmitry

