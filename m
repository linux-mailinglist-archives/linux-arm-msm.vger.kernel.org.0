Return-Path: <linux-arm-msm+bounces-105662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bz+HptU+GnSswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:11:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C40384B9F39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D13E230166DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C098314D13;
	Mon,  4 May 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPB6IrUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODLxDJAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B281D63F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882047; cv=pass; b=p5EVDkdUcdn10fuFZJ5JqsBet/co+fzHn1kjhC1n0yt2nccqMJeWqGNbpqXn549ENWB1Dx4527I+Oy5aYfhi9AL22JIOzXt9nGVyx6eyUa6OPXW7nb/60KZ9+1rv7Vg83QdOrhTfydgHOXO6LYy6AWwhfyRninOdSx/OI2bH9pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882047; c=relaxed/simple;
	bh=nEQz64k/1WoIwQjZRUfr29xgmGc05Cnt8HVAuYsV0aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2QN+fRMk4OQ6LNRYPVX8BKVcp2UomPPMUBZhmJ4wCiGSgGVHJjzoQXU2eRMIBDj4VIZpD19cfj3Tvmu0PvroFjwjGNqnj4tV95qCuru6Bw9mSgzJ24v/MPFYw6RXHcdbLbhUr7seLonmQJNXUKfVLLlc1kC1SVYgJsR1PPhLvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPB6IrUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODLxDJAZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DvKD3471785
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=; b=RPB6IrUWhMlAldNP
	e5g6kmXsWPj9jxjm9j8O2VBF/NZHIlrZ1wyASNEQI+H0CXJvB6+/BrRQvoMBGsBj
	SMPgtdQU6erPAOqdsw5gdC1tI4S9Y0kB7gX+Aos4WJpbYucUxBcL2LeCti+0AC2+
	Stc/XR1QuMMSLEwhwA0jkF0HvxzuL+fuz8juZD7QyOTH0ma7EMumuRP4pGLlnqgO
	SxdtlsmTnaD66WKOtwkMKr/LE+DSj9L9bBeY7/LKA8cLRnWwYkaInRLgiX6V8I9p
	kBJbayC+NoWtwvyw72qA7VbHIoh6CvCgKC7Ata42b9H8+P3kMBtpL4F2p/rT7fYa
	vi6ThQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmtg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:07:24 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7aa1e8734d4so74349277b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777882044; cv=none;
        d=google.com; s=arc-20240605;
        b=YFAoYKsgCCPuI8OaD0f+ctLk/OOPmkXT3XTkHNn5fgY+s1MuARdavudTNlIdeh/oHE
         +5obdXpInn+PW/BorR2LxmrwO0WtV4Vij/ppubPBqk13WBsmtF3vsDiS5Tx/gUhS09uB
         M4MK3cyCCP2+cIU+Fvx9wa5nryB/tbNJmUaa1un15nS2ggXtqQZ9PlvqBSJObSMRp8e9
         a3g5590sqKrJbiIRHKIudgCdvgzaqeWdnpOx3WQb2qgmsfS+51CC3dCqFO4MBM3a9BXF
         wI+/heNOFwpbxlGTrrsPiXNI/lcTIMG64jqS3TyUXZl4ez3gN2OFvfIjjdZQuCNrdhf5
         yfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        fh=8uDh7WcQRiB+RUfwlffrLvNCtflZjI3YXRuyiFBab8w=;
        b=IIbbHsH01zUkmYeWFB05CCfaKzwnE3GN9CbG5PCMe2Rkd+FZ08rGMf8q8qZVAmMqAr
         uXdGHX6feNzr43r2Dkv1DaQVh0HIGpY5fAyFlEkZ7GbpRnHyaJmlWKHe7x7qRPZ7Uk6+
         B9ml+SZbssnUtjREZQQfA/KeGXPQ+hJ18hBG/xUCdQ0CRbneOODjWIAkaKz2Y7eKeZRU
         vAa4JsJwhOAa2NPOEYps0YkSv2oDqGY8BnJ/lOKxoHfPmFRP13toL7AT5r1FDSJQP/3P
         KiIZUYy8jBgGkbx7WsTr2aM/bHQmWCcWI4akJSvlRTRGxU9sOrJgOMlm7PF3s+6hC9QR
         ufZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882044; x=1778486844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        b=ODLxDJAZKRmtwh6zpM/gZ2HyeXa59ldvZv5CeA394ZaZoY2dHNdlihaXx/qbM3xFB3
         IDSob4ORC6cl6vqQZ05GBwKHwa1/j53CzyehniTrpHgOUEf5riSM5yXQPtQY5IZd9vdr
         FUzPGR5BNQrK5DhegqcRegR4KccJOxX5UI0F4oxcQ5W7l4Uj6SJ+knNbW7YOv0MKRFc7
         mNcLh/0HHb1LZTWIEZ4+Kv8ts9sH0AN8YuTzWSVAg2hd5qdwQnR7spz5xTPulQS5W1uD
         TKWFKBz26s+39OzIqmR8USP/SPJScAuT4YXJ6tBZl1NdLYL1131j35ngojR3QzEKsn7r
         AdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882044; x=1778486844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTOFH2n3dVfEzZk7wWH3keBS96QiA2Aks7uS89gRBH8=;
        b=Ze5zY63Hh66h+S0DUuMg5dvAyqG4xb0jzf1UUvGPyXJBFd22bC5uE78LbTAqBoAjin
         8o1bapppjdpOu+q3UkzJ/ghCfwEcYDkk84+BIxFDc/1BIDJBKY5cO2LgMZfTr2zR8jQq
         FNwJNrVWKxfpruyUFJX+bZeuxWEPNOZiOn5qHwlHKDEPJD5QJiDGVxfdPY/kUdiOqJwE
         ivWkmZmIyUFyKvDJoPqgg8QS01g8rT1u4X1jor/SjbBLmEk3FLwL7wZ2Q45vCDXwiaGG
         K2qrtfal1YsSSttrSwzxDH233I+y+xQJaDstijv8iMXXeV7XTT1yt2Js29NpyPqhvfZS
         S0Zw==
X-Forwarded-Encrypted: i=1; AFNElJ+uvjPGZt8ROfmiUnkgJ6KvbeTHafS5uYneDMYWCPj0g5kBcVbHeZOX97E3/s2YkohfkxyDl/A4Z/A60OkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHO9bhnggJCM4iGZAMGqY4W2gBINsCaWwDKN6tidXBVD2No5OH
	MT/yk4NdC6ZRo+GGumoaXuuE5bRRzQHWz1kWWvgfjtvYs6N3fFIT0qaARSO4ghHYB9j6zVG7XWD
	uxDaHV/JzUoykf1WI2bNbsk80UYJLkNzy3zw7j3CHl094MUwfs8XL8Z49ywPegy3Fpy+cpXQB8S
	IV80gYogw7jmtCXhjf5K8YpJGhHynsSUMiSlmoSl08KDc=
X-Gm-Gg: AeBDieugZfLzXTAs62Gn4W/cUW0A9B40iuFUmsIFoBlcppp9fekGl0sL9fbnV8lWF5N
	04vP8F8eDJHzT86DFyTQKD6AkIsUPWJ/+mWYXLfKGULhWyCyL9+Io67JaOQDYJGhHAVjVzv2Ugy
	sRhBI2zkrdV7Qjj1h4GTBnL9kWOI6j5J1C4TRG1ZWXWdVJhKD4QMpcqZEqoudnv7cJa1P3wV13o
	+uVUjZKBlNsDlK4AEXB7JM5452HW01IvHQcXSkx/KYaK0LFnKM=
X-Received: by 2002:a05:690c:6e85:b0:7bd:8752:cdbd with SMTP id 00721157ae682-7bd8752e640mr48818397b3.41.1777882044580;
        Mon, 04 May 2026 01:07:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7bd8752e640mr48818157b3.41.1777882044236; Mon, 04 May 2026
 01:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com> <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
In-Reply-To: <d774b2f2-75f8-485f-830f-2a7a5dac1c23@linaro.org>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Mon, 4 May 2026 13:37:11 +0530
X-Gm-Features: AVHnY4Ig_aLpEo-Nqit4pYFKU8Cb6H2Xx8XMnZLH6cUdADQNynWyvQH0888rOIs
Message-ID: <CAEiyvpp2NseXQGxRi8zmebaONVskPyHDDb0SL11-wttH6Sj1Rg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy targets
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DtfULzDTayUXErLdyvGvcECXiVwXGY1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX6L38vVLseGPC
 JWR4qbu0EEap7XFSyV8eSzorPY52EDEhTePHqX+6MEMCcWru+eLroelClOcYhRi4PAyL7Ud1aWB
 hAQU/9o976PozQmQQA1XDJcuT78v0q75/UBhL1ln/D3XjluXNJCKfVky//fFP3CciVvU3+GMkbb
 Hl3g4zdK/XnERDlUhlrbolMQqyYCqmOwTfY2jivsWSN6CJ0n4lauvsZ/S1MYvbXJXiq4ZRR/hZ8
 c40kwT6e1TSMReLWRzw9Du40PqzCo53gFCHOWlpP3u12F9Z9g6x9lh9nbyuhrHt/LW03PSoWlXb
 jV+r1olwKFRwo+XYNAt0VGMTeb4Fb2AoUmbaWyF9qrN75tMVE+aexbP6tdT7WFhWSxcPTY9+tDx
 nAoZLX6StbHU8t5JsXZ18ftysl7viyjtQs4mmf3S2jCF8QG3oa+OLvxp5xrLagE2cKvqFyqfLF5
 p2dMjCoa2BUFsnpJMtg==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f853bc cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=FDDUSfwg_FEBtVg4pJEA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DtfULzDTayUXErLdyvGvcECXiVwXGY1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040087
X-Rspamd-Queue-Id: C40384B9F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email]

On Mon, May 4, 2026 at 12:17=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 5/2/26 11:56, Krishna Kurapati wrote:
> > Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
> > when an Low speed device is connnected and enable DM interrupt when
> > a High Speed/ Full Speed device is connected.
>
> Could you explain _why_ and not the content of the patch ?
>

ACK. Will modify the commit text.

> >
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > ---
> > Tested remote wakeupon Glymur device by button press from a headset
> > connected to both Type-C and Type-A ports.
> >

[...]

> > +static const struct dwc3_qcom_platform_data dwc3_qcom_pdata =3D {
> > +     .uses_eusb2_phy =3D false,
> > +};
> > +
> > +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata =3D=
 {
>
> SM8550 was the first QCom upstream SoC to use eUSB, should it be covered =
as well like SM8650, X1, ... ?
>

Yes, I tested the patch on Glymur, hence sent it only for Glymur for
now. Will add other targets later.

Regards,
Krishna,

