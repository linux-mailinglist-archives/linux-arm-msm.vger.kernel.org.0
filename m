Return-Path: <linux-arm-msm+bounces-90531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOGaFpVId2ledwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D278761D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585E23048B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963E6331237;
	Mon, 26 Jan 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="im0CFPia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV2edqlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5E30ACE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424961; cv=none; b=NI8evz97xDaOekBBu6QEE64I5z2m62rL0XIHwRql+d3n7WYoqpkiflstoUoGbvIpbHVcoYafps5I0TBjt4PLnQTNbPSIMzdzF+81TZBqxgBBhhg7VJrHlBxytY0UZB+1gWV1vZv9Nu6oGxBuV1C2JDY8hQciAJArLNhtmsGRB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424961; c=relaxed/simple;
	bh=Kjm2rcSjVyqmGCwnjvAXMccijAXuBlO1MOu68Uo6QCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5nYzgMhT0n8bU9b62TQzWe0SHn3sj5rA62lPslZ1x04CJDGIHmVC201hBEGf8fY//f2EH/wtpGpWGi8o5D9SwcpMQOUDb7xJZe89MCNHPAaeV4wkP99FelvVhjIWvCCXk5WyR080hbN8T8Zf4d3MBagwJLGJUrh4D+1vUJ8o+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=im0CFPia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV2edqlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q95KTD1075287
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mBxApWBw9/gATF1Op7IC7eoA
	//6lsPvHHF1Do7aOfTY=; b=im0CFPiaSfflPQ66TcnatfOVAIGaHKTfc94+aAjo
	XiH7jxh1nClfXk5HunIimH4u+eYTMdoBQc8TgFxVJqDH/1/ix/a4It43BrD//BzK
	3BhSr2VqdBO5teX98ynr0S1sGioYZIvoBovAVUHgU6xkLTYoY2l0YObbq4vDugXm
	ka6De06KIfrW0r6fdZ3yuFpVQGZQTUsxuUqpkJRSJQPUsezgYNa6UuOkNt1n3MnO
	M7yYl3kyLR7UJu6g6FWG38kPIhOzRIDGZ5q+mxgTw6YeZ9sOtEn1w+BfBxV3VJLS
	Xw5aJV3xEqtx+VakEIRzH7TcorOsyzT6abw/3N6c+V07EQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f48r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6e8f62ae1so701120485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769424957; x=1770029757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mBxApWBw9/gATF1Op7IC7eoA//6lsPvHHF1Do7aOfTY=;
        b=jV2edqluPdQwnUlxFqPNhbXZrQok38EK8rheHeom6Gn57mI70KgvML5OEpUTFS964S
         BdeeRhRyf0SWzJ4+U1Hit/1EonVIkqT5JrgW1KOSgclEc+6ZKBGg6c+fqw31HF+3IVPt
         Vcx4+418v12yX7i3fwi5S4rCesQKn5+OYRApd3bLnhfZ+dzz9p+vBzYgcrynh01ynim9
         9sTie1mrTw5D1QJq9B/zrEZiUFFNpdLzDyIDJtC49G9guc/YzbcycvRlmH+4TPOaWd+9
         0n8hbFtIQ3pbNm0ZJh8QeNwALdjjyj9/8dSbTRptKc6Tx5KHuDr7pRTq0hh9Ufq7xSRE
         n8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424957; x=1770029757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBxApWBw9/gATF1Op7IC7eoA//6lsPvHHF1Do7aOfTY=;
        b=HkzyIDyQhSFzr/KfP17boI1XhDg0hD0ecUg4KfVXtHY8w0Dd3GeFZiejsma7kSAwHF
         Fsgl6A6d5DEknIE3b8hN/KDoMbPhOuL+SkidCvxLWcp8xwwO7laqGeyYVNlNj7BkFU3q
         2ZRm1VnOLsxots3BaSgJZ2xdL8ij/99+wUcmzrWZlkJP3XWbv0jqLfk+273JS1xzoTQv
         fPdnVZ4J1cXUHSTTQNYOsnlGBoh8u+LVmcBCxODxUyNCz9mU2/1jy3fbFxPdEFtq2ldQ
         QvHfxFKo0gM09mk73zR7ZIA5aVK9wdpaSGHGYQLDFmPtPPRKrXtT3Qx+6U6dOr/T4QYl
         oFjA==
X-Forwarded-Encrypted: i=1; AJvYcCVC+WuSktkJ7PvVr+sHK2LxYLJrV4WTICsY31DqAF/nDJuz9B9IOgMN+Qu0e0h+XTTXylNq/EJY/v/w8gHm@vger.kernel.org
X-Gm-Message-State: AOJu0YxetG88gViw9Nwfokh+z+jbxFx07HSV5WaB0Cdj1G8DhAjJxxKb
	YbZbEjZyZIqb81EnAYncYnqmIpP4c5RoSZR1gxhKE21+/0UpprfmJIOPOMhn+qfc5hz4rpIOQbK
	pzxiKKWnNWewV96pMbggtN7q8jgqSPBf2LfCZLMEw8FXt/psBihg7d5Qzy2lKACRij0AI
X-Gm-Gg: AZuq6aJG2//DUY1ng537Re4bt1HyvaYHKUDxZYb4S2raxUoXAlPGDfzm8EwyPiYTYGS
	J3jhNQNyulM6p3/iFOYqv0sviL03mWYl+N4+SnUw1L/IlgytAX/DRVFXGaFxPm76pJFPuyv7u6F
	2mNsprDAN0jxu8JogveC42650c3iMIskM5dR7zEdgNNRvcBz/WEc2cSRIgoOsiRRQMsMoC4ajCC
	T2cyYnxZMOMGebS+ExNdutOBWKoMNFlYgc5lHaTndwMN4aXa850oP+yXKvsUckPVTo05vguGX9K
	Q2rGB2qQdChMbgr098L1DUzlrEfOteCn+GBj/OnPVH5f5vXRS8jxnQc8l2d14iQBuseqZj6mmmK
	yc8owTh5v2i4mbPX+2rCgE8HZs4Oua6hr/en9AsFIXQsyG5ApWeCDW5N4d7pYiXDFo079oTShuw
	DqiGsDlSfXVDcO9gaoXgsioYg=
X-Received: by 2002:a05:620a:1a22:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c6f95c5136mr421046585a.19.1769424957256;
        Mon, 26 Jan 2026 02:55:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c6f95c5136mr421043985a.19.1769424956776;
        Mon, 26 Jan 2026 02:55:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3a8sm24351261fa.14.2026.01.26.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:55:56 -0800 (PST)
Date: Mon, 26 Jan 2026 12:55:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Message-ID: <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6977483e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yuvT0TRLOIlni_b0vi0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PGEP3RdlC5WqOQtWo6ivRLop69xxbHsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MyBTYWx0ZWRfX5ahRJeyPuOcf
 hXO46aWFefg/873XbcbT0l6BDR9z/4JTuudF22GwnHVHjLcy7YhTXX2zda8eUwoeAewZN380Bjb
 BKvqXhu4UauH2LC2f4nGQz8l49Z5kOm4pWvDqQLV+FDu0juNVEcyn2HqbgXqIrivuL8N/vEifl9
 b+RBhk4LAgHrEhVzY7WrMu1WGFp2eagiwChReYDyNMscM3FpFmji2Ct64VaMsk32a3sbqgl8bDN
 Kj4NMU04YRG8AaRWyPD8TUPNbvV6pUBux6PmgUarme1CrxxW4MsP+UT1983OfxuiGUhCWerhPm6
 EkEhqygPiHS6N3jQU6P8jByyaUcaZWhAXvwWAolbeaZORcb+ai1X8ayTQR5iQ4aVb0bgSlxQbzi
 CGRvXg4lbrr3eJ/7PrYkd3SeY1JKKexMxJaGWkL7qdu/mlKP+Mc3McqH+zJHGZ7o7uLFmpB6Tjw
 uDx1poRwpJBopJ4jqYg==
X-Proofpoint-ORIG-GUID: PGEP3RdlC5WqOQtWo6ivRLop69xxbHsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90531-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3D278761D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:50:56AM +0100, Konrad Dybcio wrote:
> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> > SM8350 and SC8280XP have an updated version of the Iris2 core also
> > present on the SM8250 and SC7280 platforms. Add necessary platform data
> > to utilize the core on those two platforms.
> > 
> > The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> > driver is enabled, but SM8250 and SC7280 are still disabled in
> > iris_dt_match.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> > +{
> > +	u32 val;
> > +
> > +	val = readl(core->reg_base + 0xb0088);
> > +	val &= ~0x11;
> > +	writel(val, core->reg_base + 0xb0088);
> 
> Can we "open-source" what this write does?

I'd leave this question to Vikash. Hopefully he can comment if I can
open these bits or not.

-- 
With best wishes
Dmitry

