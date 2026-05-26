Return-Path: <linux-arm-msm+bounces-109842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHMYI4OkFWprWwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 856EA5D6D09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCA9E30295BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8633FAE11;
	Tue, 26 May 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK9ncPOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9DpACHr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D023FAE09
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803027; cv=none; b=YMwfrswIYCfQXHFO0nClriBGJ/YO1Cm0RkvTqpymlEyBbzn/JSAyqeo63ODfXKCeQZM7jAD4/c7cCJHpjhwgXVN00A3FURX59gNA8ertW2L51AjReh08kyomTN2LD0QrUsz2tv7tzbxuO/bU09rSoXPcwa+8I2Tho6OdrNhi0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803027; c=relaxed/simple;
	bh=2x+GvNK+8LsAyeENUcpy6NQiC7D+AMmUeAQf6e9WMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJJu695/iLhEuP99gmi2ndr+epEut/XlvRuiQMNQ3TEMGECv+uBol0g/X84C6p12heX2+tpBXqhFWsE4rg5RAyj2tLs1wQyFlAM98UO43uKNKRd04P5UqKQoLsclszOmQTBmhEBu0EMzDwAeak32yopKgX26evrghYdXjIau2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK9ncPOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9DpACHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNGg2705430
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSnJHbNRLCRzAj/uxtSz2ph+
	Cjf0LPA0vDHzMyAXWg4=; b=SK9ncPOubFILx13HC3G0erUqgLSsIOOXtK4ocNqc
	qrCWASWwYyroOH8PSf3EgvEMU0yHcgL6u3kZWgaOs6DF0xkM9XiyhXbqPCrefmz6
	EEZ19cHiEs6nXOFC4CtgMhQAEiNe04cwIc8VuuJEGaiNpQXpXTLVfmI3tI+XbXQQ
	t7kVjkF5bZx2jDygD4a7PD9x2Qp4kg9FuPa712FySxOmxwOGO4IMIj75mD+rOgXl
	mVMJufypweLjtvZi6rEOD+ghIoqfTfdGcyCEK5eoU6SCn4Kaf4ktvsaOIC/JKfgt
	y1fuhLFAwUj/LFBu4GRf1RXgfmpQ+DO0q8cxy93qCRdr8Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vgj3jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:43:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-958a0e94ff9so3094190241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779803024; x=1780407824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=C9DpACHrV7MayhcKk1Vo7RgWljsUOpWDi4Hsq6blxVCj8le1r6GOM714dIKd1GYzlg
         05Gcaxor33ALc1KKqXgy6HF6JSbEnnztNsgMcFlhBut9TEd+EuYeqj3dBZQ6Ur+dU3tO
         XAw7H3Ak0k4sHjipEWGoYlMQuyxzhiC27NOpJHaEkblvW9U5gYF2ajXx4TX2guTR+zuT
         buFbEMJfXeI6lUJ7Ol9DBmbjxRD3TIVY4xpSsnkVUyc2muUWQfehxo04gMiDJXQgdfQS
         5RZqlA0IhW5YGQ1qp7QgqvmZA3RGY3wAGfhjLNtFYDZKhImQJzqTHIy83luEBn51ZmWs
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803024; x=1780407824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=SM51bT+7Ob3RW9vuGSKXRKn7dC/V67w7iRbSPxXguhAb88XIcXa/PoFAq+RIYjrQtm
         EBi53/cJQd97g13ZUa4UAh6D2HXDjr36nuSFfxFitpA/NuEUQ1V0fFlIeEzVnsndiOiZ
         K3Y4lN5gJ9r5aX50djydxRNtyUrhJ0/mAhW1lhyo1TgJFzKNL0rtr8H9JUqkIRDQILj3
         0rrogJIxuace3p1KlOJAL7fMK1mio0LFdaDBuMnSLAHyHAQcJXcnPstBhO2wHqOPxEew
         FenRZl53mXrj/1ySI9vsDtg8TpqIlinDW3SRHjNRsM4Q4jv1GkTTPkLu0kYSz137awYw
         FvOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rNOcKcSaN4k6LdXFjXUxesuPZjGNNTSBvZ0ek+uzEfVUGTHoqy93Xoy82a+Lji6ZpOQ091O1zvrnNXnka@vger.kernel.org
X-Gm-Message-State: AOJu0Yz86v9jMkb9CJQzsiKWRqPFJJUS++VJlEUxpWB6HaiY6mrLdZGG
	MFuyubxP9tDXzPrxNyKINBsQd+xY0eUivjNxGGo3jXWL+mb9f38YQlB08ukIn7d+0f7PPMOPTTD
	s+4SHeYlARsYrV6b7xfGA/klSwQdl/miRnflgvNYKnvHHYNEkNyPnd3bnXPrnPR9EjURG
X-Gm-Gg: Acq92OGJcytZIBJEc3pdkY9DSd16otcfcm5bfsi9MA39Uinh7VGkGe8QNYXU/g56RsP
	rL4HPUAncNkkAQ+VlgimNNCs7HUk/LyclRI/HIXevBpfJzFlPho7wjb7hkwXBcaJhRrwnfAXnWQ
	j/cEUjxbbPA8yEJtr+ur/31LbqnqGIHbHU4tkYS7tOk8CqVIPtgg1MPpZiHB/dDT+85oQqF4aI6
	oUnPZPg4MCdGg3IMktlKgU9+9sxsD258enAvdosjl9IXYXlXjziS6SDwerI5yKjil5ZNdlZrLwM
	UdMWb9W6q9Qd7AQDrZGuo6QmfvcRbdZHrlE4YAjoD3frS+phpORmXpc2wkNY6LzOMCDKD2PvZ5X
	JwkEqZ7lNVz1uHd9bNjPwJc6+dNYIW4oM+RlRP+TMJAIxh1wOvLQx9Dj7kLV93Z7eIQtSJwSgt2
	HqBGFmFPYrs2TfF9bFDf+wdXuEoq9x7Hwp1Sc=
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549706137.19.1779803023879;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549678137.19.1779803023409;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d4d5sm444972e87.80.2026.05.26.06.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:43:42 -0700 (PDT)
Date: Tue, 26 May 2026 16:43:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <vrbly7s7cguxdubha4mxj5hszicp5dqkdmfagqdxruadkdddqw@qps7wgp2etqq>
References: <sYZHD3u8jIct2FxvEcwr_2zJAwlRZlgApp_nZRHcBHzhnTYkersBivmgF9agXwr_MAMQq9aXHnEfhYlOs_B6qw==@protonmail.internalid>
 <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15a390 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=tuamT_7bMBkhMHfOO0IA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: cEANEgNLWtb1UyUEzpd-IFW6c3uXp-zB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfXzLbsrcNJYjHp
 skpYjGeDs5kV6BOz16mvmolElbNBZsLMFQ+b/BaDMKSatwTRaoRWkhrmdrZ5BYxWbPg/NNFQZ1U
 KZno9QM/2akcNKiek3yA/cXnqcg0rFp9SfENkLEKDkBLBT9Df/Qtty2X0K2OQGrAIQv6Zo5qVG8
 AIo0o6IJpREQTcoAZDqpWw08W1dCa5gP+oFlaNz0t2eUzEKx1qwai1YmYq1rF9g1SO0i5R2NY4N
 oPRDaVkN3kFItH2VVeD0ezXG516GkOYC9NibmruwT8/bxHgsaHbqL332M4oOZJpfsFfrjR6WC5b
 pVpR8mx9QKCMa4Z+huFA/GMwsoigwmO4OiaX/8Vh8X8m9Su4LfRfVW1ogsxnJrZvR3y0v0v5Vox
 QSuHgjaXBD+2l40kIVACv0DjdnnmK/Rdx5I6mgl7e1J1r3fXo3FcPHP8tHP+1uERqu049IpoKWA
 27wRfiawosxLsAD5sxw==
X-Proofpoint-GUID: cEANEgNLWtb1UyUEzpd-IFW6c3uXp-zB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260118
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 856EA5D6D09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 01:49:15PM +0100, Bryan O'Donoghue wrote:
> On 27/03/2026 20:19, Dmitry Baryshkov wrote:
> > As the Venus and Iris drivers are close to the "feature parity" for the
> > common platforms (SC7280, SM8250), in order to get more attention to
> > squashing bugs from the Iris driver, flip the switch and default to the
> > Iris driver if both are enabled. The Iris driver has several
> > regressions, but hopefully they can be fixed through the development
> > cycle by the respective team. Also it is better to fail the test than
> > crash the device (which Venus driver does a lot).
> > 
> > Note: then intention is to land this in 6.21, which might let us to
> > drop those platforms from the Venus driver in 6.22+.
> > 
> 
> Not applicable against -next with enough of a splat I'll ask you to
> rebase/reset this yourself.

But you have applied it already:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260525&id=8f100f5896e1ccec3802dafd0f719627733c8183

-- 
With best wishes
Dmitry

