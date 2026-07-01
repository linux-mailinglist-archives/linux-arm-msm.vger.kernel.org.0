Return-Path: <linux-arm-msm+bounces-115714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPxSNvwcRWrf7AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:58:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294746EE712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QC4cQ4Ma;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jqx8YrXY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115714-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115714-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B7323207D49
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3CF48A2B6;
	Wed,  1 Jul 2026 13:25:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14B3E0C75
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:25:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912346; cv=none; b=RN4PssNKiP/e6McPwX210mfsicDRXbNsk6O0oykklYA3nnkKwGMN3g+08JDkNJqQjTFxkQtyWIp/rwPshUTF3KBoVuzKyEXxyF5sA7ksJVAMEoJBgyGowvyuWE17cFRjUkXMEHLgbaQBIweMpCFewJfD30zJo+HeDAGReKgnVwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912346; c=relaxed/simple;
	bh=F7xPlX5Up0dNlN3O/LVJt1+uOSHUlkhvPzH88oAA5BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQxWLhrhRTwAzIcQ6ADS3TI0gqAIbjsZGbyMlJM6cHVLYkVaFfczdwiXd95kTsQBpoZ9IUh5mOew68sD6x5EYFeJp0yDwP2T0iC+sKB2IKYCONP8K86kxARadMOtUHqDs7v/Jctl1E9MbsAkBKG/yqOdq23AZIKERkQkuF3HW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QC4cQ4Ma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqx8YrXY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8a4u744366
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OEHtM9VnNMryK1PFmC2g6kaA
	Km+UjqsYWUcgciyfgN0=; b=QC4cQ4MaRmKJKpK06C50ldxbl0RezQ1k/DwY82s0
	V8jZjd5cSAbWLUuKj8J3MMxNzRRyIJbDUYim/rMImHN8CXwn/e3nsBHGZaj6uHMp
	S2ypriDeZoVk+WbrPT1yKyq+zUxhdnst4yd+Vy1jkZI8pyHsSbVcxgmWlCzG68sl
	vXyk3PEoMIQy+XsKR+n8Z2WqmP5kl9ab64Mk7DR8Pk7LhVPLuVwfOJxr7BUjqItR
	QiOJT7bWklTlC6ND5HXyZ9fVvSFbvEJqDcrkmYTMsP0yXYhsZDlRuXJM4NgXkp1v
	WSjCMupU8uJs+GxFAjVTIRbqHT4B1rhJRS6taVnQMnqmAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thps3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e663c29f2so82030485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912343; x=1783517143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=jqx8YrXYQVFC+nuSN8qgd/TseIW3t+X9/+cUOY18EnF8LmnowilP4hB7uylRDCgIh3
         iOQjK31XI+D1AuFdJhcK1qWTzPIkIf+nuk9ZmMy08iMoIytDBTBlPORA39zWHF6pH0Zr
         FiG6jAXvxx4fEcvWowLAAIGVZ+kNvmO/FCtepS3brNjmBBG3uqBALgQWt1B/TmFGf5me
         Shy7yHEZWTM17a88+52w1/i8u8dZX4DH3D7Vu5psLw5t20m2c/WRWG3b18H7HpNpwwX1
         ezFdSZr+jiP5bNP+NQFQAQIFEyntK1O9ERmSk+d9L8GDYI3oUskJlOyf6HM+jMykrNR7
         QihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912343; x=1783517143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEHtM9VnNMryK1PFmC2g6kaAKm+UjqsYWUcgciyfgN0=;
        b=J41R3BV+WjcrqDAnoMyqF1u6GYCKekGh3jhWvs5ekVXScBrDvHHRl0IQl/l0mHx8/G
         TWCIxioSWn8fUVIRqhnBiLRUgqeRJ3ordG35L2iclO3RbKETFIR8f8eNnqFKa6hdR47M
         Z8N8QNNTxtsSbzW8dd0DoZQJnXbNxEa8RUGIeeoGeq+LLUie8GgMHpJclCa7RrALLemv
         +QfPBAsUMA5bhs7jLAREYg+ljoJrZW9RPl3aN+NhCzf8ddH15lp0WUqED5HlBkOCf9Mq
         VNt6Qz6arn5lp+Xv3MhCHFXX5J9ZR36+lgztmu3r6ymsVVGKUBKyYiAlYdI0d0xNr9+U
         DF7A==
X-Forwarded-Encrypted: i=1; AFNElJ8JHmRBexEAfcUekPcTgtUSJsUCs4nc4lOuAOahFbmnjulCjMv00NLE7Ca2a6CUrqFAjASGuUDTAKn6hUeS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz65g5sOrTabMnwzvXpQvnHyusJt2ja6cddSud775uCNHymoPsi
	2sswEC9hWMJgPfAufomNeioAiMzSAChvXEbPu16maLK0cD5zbu0ix88JVFB04YK4sbTvMso86Km
	bEss9vhkjZmo9kGJNwCkl4kOrc3HDlYrbt+ynRBS0TLdOlsn78mMyExL6lAaU7R4c208m
X-Gm-Gg: AfdE7cnjH3kIVg/i7NRNqSL3+TFvkSzq/mnpcC/EfrpW18LSKZq0QgITBUKpQ0LzNrE
	+Hn/Dt82t/HrslfjOvQUddVsScMSPeNvl3ge4/WrsWWKx8EeX3JkL1IlkclqUB6gtrzmdlTJDZN
	XmRmWr8korFaMKdP6O5YGriALX6cLZ3dCPkEmxiZVrnPjaScMkQu7WfkOQR/VOg69QK87m+HV+8
	Owmo5+9Ju20odZML7ErQRZKH0O6Xqr/g49Fnkwz89J0I+XS2ZmkIZr+93pUaupoTL2d9PzVyFsU
	gSbFIZQCs03yOORVfLATcc4gP9P0KMqMVIMkXiOdvnRiCjLMh13H5OMftU8iEDHir9P0rjPocea
	hph5/CmZaLP2Drr5BQ3n2YPLMLbZecqBN4kSjSMOVyC4CHWx4zO1wJhFC6doYFNBzPjZ02DnS47
	rlAVJpWyM6sNgHUFm0JmQt7S0N
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824507885a.15.1782912342652;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:92e:5949:3563 with SMTP id af79cd13be357-92e696e9158mr824502985a.15.1782912342141;
        Wed, 01 Jul 2026 06:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b2f70e51dsm4422291fa.16.2026.07.01.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:40 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:25:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based
 on received info
Message-ID: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
X-Proofpoint-GUID: cI8xWRy3Gsj2R94eRGFo0F33IHDDw9pe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfX1sSs1/HEaBpi
 +WgB4skN/+mjbDQJDxBPW9D3dBbT/Hwaz4SoJGDLC2D3CVgnRGWjgjmJxbSsf6QBIffJqjL7x12
 mE9MGl+DsqOLbZYAHAz3xaguvmVpdXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0MCBTYWx0ZWRfXzQs5QXzBgzp/
 +wknDxB4UtdMYJuERuO5pxWttgsd06bsiTK58gpZt4GU30YosebRbIwktzpS7HUWU9499Aonvzr
 SqeM1dqSVoO/49b0iDj4E9ltLi7GwnsuFVcNcFogv4XgCPz1/REtPutrFe4KUAu43ekUwH8XCEb
 WyNL3vzVJDxN8QlvIkpA09DweTk2vHsV8+n9MeTwb/P/lgbkrO8yNdhYoId1Sg7NYttpLcVAuY+
 IIbijHj1KBQrdgsfF4gh8N2WKpHdjfpSOXWHxDLlJguO/NB+IHAU7dxyI57JRoeqehOyea8yvAB
 nvbt2PhD2iFeYYKuqw1eHd4oHaTK0HgSU8GYna+ldh07inX6DRRBNtFx1lFvOKseVWqLviScTTP
 5KTGtYw1Fjz5xwrzxvyWWcrg2h2/p3tP39NmW2A48T+ZlZm1QKqhhlfgYzI4qoFUb68/nV2t9QZ
 yPB5Pz7aORErL975Ypw==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a451557 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3EHR-On4ZTnEfFEao4MA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cI8xWRy3Gsj2R94eRGFo0F33IHDDw9pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115714-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,47aaykt6z7yc:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 294746EE712

On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
> 
> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> > Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
> > driver should update buffer sizes and counts from the received data.
> > Implement corresponding functionality updating buffers data. This will
> > be used for upcoming support of AR50Lt platforms with Gen1 firmware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
> >   1 file changed, 74 insertions(+), 1 deletion(-)

> > +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
> > +{
> > +	struct hfi_msg_session_property_info_pkt *pkt = packet;
> > +
> > +	if (!pkt->num_properties) {
> > +		dev_err(inst->core->dev, "error, no properties\n");
> > +		goto out;
> > +	}
> > +
> > +	switch (pkt->property) {
> > +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
> 
> If i check the venus message parsing logic, it loops through the packet till
> it hits the case.

It doesn't, see hfi_session_prop_info()

> Here, we are assuming the first packet type, in the pkt to
> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
> multiple properties in the packet, and if
> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
> would break with incorrect buffer sizes.
> 
> > +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> > +							  pkt->shdr.hdr.size - sizeof(*pkt));
> > +		break;
> > +	default:
> > +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> > +	}
> > +
> > +out:
> > +	complete(&inst->completion);
> > +}
> > +
> >   struct iris_hfi_gen1_response_pkt_info {
> >   	u32 pkt;
> >   	u32 pkt_sz;

-- 
With best wishes
Dmitry

