Return-Path: <linux-arm-msm+bounces-90386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHBCKTnUc2kCywAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:04:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFEC7A756
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 048723003715
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0683A1FDA92;
	Fri, 23 Jan 2026 20:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LthqNfOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7B9Be1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090421B9F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198643; cv=none; b=ps3PaCre7VoFtWxRQmjl00EvV4Fa1Owgq2Zgt0jYXrsiGw2wgmnFxBOoO5u6nzZcsVa7jcdH4Uwt+3ye15Ojuofa0Xj+Gpjj/wHyBNz9qkYSbYdmpGQhn2OWjdOuoKbFSwpgRMljTpLFzLrpMEZFwWVCQiVgtrZEgDWHirIRRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198643; c=relaxed/simple;
	bh=+f9tYDrKb1cz/d1r4CVPQwHBvG4aE8SqqH8gPDx4EH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OESDiPKvf//SfwLAq9rOJ5OizdLuqH1mQX9wufEx9w0ojQV15XzoDGRqAfjv77whZH2K2MSL4k8vpJm+FnJ+hjq5h4mUlM1oJMMLwBmsOgLFPlhLqTHq6Sfip0A2SI1jcn9BnpdSM6Osctei5aZpipVzDuX3RUviF7UuhdCzHkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LthqNfOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7B9Be1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NFPGJS2209312
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w27dChBYKluiVA3YiibVo7/a
	4HoOo8aET9HdrXPKfZ8=; b=LthqNfOKmjVZGVTDkSJkxUrlnJZj/G3tTDl1wB4b
	OfGngm7wYg1JdYn5eGjUrVyH2qPIGIG7lG62AiEhDlDSQzlUTwl25LqI4KHvHj/K
	sl/IOYVhp3p+HonfJsCVScgFmVnzsV+Bj95TCbKI+GL90/PPkUZiSKKZW7RI4t4F
	qL/q+52ZxWnowU0UqBhGVw/uWAHERXYc8URd5al/SoGWX7OQFR0xHsRHfXk1T/Gh
	6qZJwefT9QKC/J/NAoBFVZdD4rDkT1OV1YVwMCcnGxBTgzKBxvyeRYGfZ3AywHDs
	315U3gA3R30z/yG1O9x2qWpVuf1QOHzvZarlucxO7IzdqQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvbm6gu2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 20:04:02 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9483c03078cso340577241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769198641; x=1769803441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w27dChBYKluiVA3YiibVo7/a4HoOo8aET9HdrXPKfZ8=;
        b=D7B9Be1PiDWPNkt2629MKv9z2Upm+fzz3+6MICTYBUgoKZKhMZpbfrC41NS1V/d7Kc
         41QKvsg+1z9qU+vhAknJgkYU1SjDttml1v112DHZpyv9y4vaQmCAOV1TiY1ukF67RKNe
         EVEDBjEJLbIGVRge30Av8R3sJhkWL1J6aPToe9m7YWt8KwA8DQ9OnN4yXE0T2slMD4n6
         HI3GRW53BQhhMz9P15mcDMY7bsjZYIk+BhDbfJPx9TOZx25XGrjNT7qCU+peuy5bH0f5
         rv3nf6KJgIV3yn3YLME3rHM/zMCxejcby3aZ6Ym96CGjijZsM+BinMydWOrDMCuzzXHX
         BaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198641; x=1769803441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w27dChBYKluiVA3YiibVo7/a4HoOo8aET9HdrXPKfZ8=;
        b=jS6oKuzWXOU8YA0/AoFDmjZqzFhv0eIkjBVoPQmUOgMy0p3Guuk4ZFiCFsR/G9z9n9
         mPWXxA9MGCVbrSszW2g/KLu04B6jxfkfbnv63rzaZd13sdSgdbzvC+QgqU2me9Bzj92I
         pk30d8JIJdejrppl7cJocBySNRDwnkBY482dWNJo36Ore7FDIc1dq0HD6Ahy0EZAkCNA
         7O/J9obzmMp2umsjApBa6mRXfF4ea4EFjuEt6538o++OE+tvamVkSk48pn+Ry7pzHJcQ
         +et+eDZA6l35ZyfjOkp8xI7cMihwXDZL0xXGmmQdjtCcSSM9rGUOT/h0S5w67FDcxOsF
         bK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuCKGw7NtVcjXlw0uCXYD9B7Bp/H5l7bDXTgYg8FTgIMS41EpURrqVperG2V8rcEVOiiit1wSPs2YbW56j@vger.kernel.org
X-Gm-Message-State: AOJu0YwhVwhKa5lbP3/abkKz+e4Yh6PBWLpyaRQ9NCOhiuw5I4VTX+kf
	CXLR9S8HdpKtcE79p5SwagkqKRj6mzHJeTq8AGC6jtMflEUX+GUuj1PvJpKIrLmd3ZUh48Q/+3q
	oPXBojYM4QtKVWp1QsiaaKY1QktSHc3GsK1PPElIWz2ZGAcxquThuGtVXiSQpPRiZuq3N
X-Gm-Gg: AZuq6aLPYSyY1l2o1sbCVK+92AUqYmbW5DyE6EobzEYg5n1sug1etc7pputXJ4f2XK8
	Cvhh/ECOHm+8NaOXaJQHUCDT4rA6d+UALZgudLHT9YHoOFGI1xC+vdCec0I7WOFMiXS1bqUYGnN
	39KYbaesKf5Hsa+XpbzWzOCevKIhY4TRB+QXqF12P89nAZk1iKoIn1Z/KoKMUBBUtWxMxFnkM6q
	rZ5qD2v+uz2rKUeXYNOItvzZF8ae2mGi6VuafiV/JMDWzvdw+WsPosoomd2itZQ03yzEtYMQqj9
	AlzzA+sw4FOq8/grKa84sS8vPV3fdPoJ6snfdFu1wdRqEuyxAkGVcmVCWPZvusDfV5muuYmlZm0
	nEy7nQsr8CtSfF7v7V44Dqc+7L1OBIImPoAiYIGaHi7QTCi+EWzTztLURFX1QECQ/lLcvum4P/N
	i8ElgyvED160mjiTjoe1UswzA=
X-Received: by 2002:a05:6102:c08:b0:5ef:aeff:82fc with SMTP id ada2fe7eead31-5f54bd20763mr1368421137.37.1769198641232;
        Fri, 23 Jan 2026 12:04:01 -0800 (PST)
X-Received: by 2002:a05:6102:c08:b0:5ef:aeff:82fc with SMTP id ada2fe7eead31-5f54bd20763mr1368411137.37.1769198640691;
        Fri, 23 Jan 2026 12:04:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df630sm893747e87.21.2026.01.23.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 12:04:00 -0800 (PST)
Date: Fri, 23 Jan 2026 22:03:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: qcom: pd-mapper: Add QCS615 power domain
 mappings
Message-ID: <czyzzq33huzyemqjkicfimmcdrkh3a3dvmxd6wub7q2huoi2uy@ifasxehwrb2o>
References: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
 <913bb253-f040-46d8-ad27-51d7485a8ddd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <913bb253-f040-46d8-ad27-51d7485a8ddd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GoRmoOoWBjjUUjWVM1uwMTju1fs6czXA
X-Authority-Analysis: v=2.4 cv=LvSfC3dc c=1 sm=1 tr=0 ts=6973d432 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hdK2ECCG5L76yljk3pgA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE1MyBTYWx0ZWRfX+41A6vWFMVr5
 jkFdbldL5csNtWUYL7GerEe/M0Kahnj/GAzGMzg/TzI0REsJgcxA0TcXEDZHd2cjnjE9nQEZzO+
 sE+Hild//O/txwe28xDLW/2q8dL/2t9Irqbdxp9F3K7sPiKIf2uFgqoA8XncsxYe3Z4kiEwsqcI
 96Q2AXeXfqrWzVrX8lySLnoQ0WN/xXft9l52kmzZkIDJZsCKYQtamr1koDmdWGa7XrH+HbFS+6s
 VCbgPeHT8IzGgjK1PAhRe7fMofMxlttg/AIU6O/dMn/zSzzj0Xb3m26VOU3qp0aR6Zm3WBoaM2z
 0SE/Fr7rWTtlFv1k5a7CSO1Zp/29CeOTtCGwRzpxuYBQCCCC0upxw6ys7jOYgUAEKRdA1+hM0Mi
 btqSRhor2noFBV3AG74djfJRITOvPE3P40i2nJ0OmKVJMz7GzF3NKEQIF6MJ/8YqXVWrYk9zuSA
 HvDYNyIkZPA5lA8c11w==
X-Proofpoint-GUID: GoRmoOoWBjjUUjWVM1uwMTju1fs6czXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90386-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BFEC7A756
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 01:07:45PM +0100, Konrad Dybcio wrote:
> On 1/22/26 12:13 PM, Le Qi wrote:
> > Add the QCS615 domain table to the in-kernel pd-mapper so that audio
> > subsystems no longer rely on the userspace pd-mapper daemon.
> > This enables proper initialization of ADSP and CDSP domains directly
> > from the kernel.
> > 
> > Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> > index 1bcbe69688d2..884a2db9bb08 100644
> > --- a/drivers/soc/qcom/qcom_pd_mapper.c
> > +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> > @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
> >  	NULL,
> >  };
> >  
> > +static const struct qcom_pdm_domain_data *qcs615_domains[] = {
> > +	&adsp_audio_pd,
> > +	&adsp_root_pd,
> > +	&adsp_sensor_pd,
> > +	&cdsp_root_pd,
> > +	NULL,
> > +};
> 
> No modem_xyz?

There definitely should be mpss_root_pd / mpss_wlan_pd, otherwise modem
will not load WiFi firmware.

-- 
With best wishes
Dmitry

