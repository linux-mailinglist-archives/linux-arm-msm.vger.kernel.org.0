Return-Path: <linux-arm-msm+bounces-114044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R4j9AIVWOWo8qwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:36:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D66B0C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:36:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aMuS2FYc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JWZEVv3a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F92530226BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F65A1F151C;
	Mon, 22 Jun 2026 15:30:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185593911B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142253; cv=none; b=essJ9whvwwWiLwAkyF245AyI0heriyUItBiu7S5wg/QWYI8lFco/3EOkxCH0P5DfARrQu9fdoO5ql5ACOX6vg+cslpqGz4+qXdF5e0Wxg4flVutTBprG4wJyAK63MGwcb3R9cRWIqdx06ozcCYeV1DvVn+96yGMNnQnkDjL4R9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142253; c=relaxed/simple;
	bh=8S0kA32J1+lPVud5gltXSiMqVNaA+7pFkfB/HTQjusQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSdl1Od+RFisfZCd3PQcLMmdYELfDIUUIv7MAeSsyOkzXj+BeaTMJZgY5gCo+bJDMfCAQDEMEB2DRm5CYUutkqGKyNUvUgb4ZtsRn0nppunIs12Sct/xrVtoK3e3XvR4NVynAe6ULxHGpD/5ax994VqqyqtKfm2LLqTp/gxTgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMuS2FYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWZEVv3a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFjqU701420
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oTLskQpAxIafqBM4bwRBYXlg
	B6bC1qqplPkstd54/z4=; b=aMuS2FYcM5dYhv0oRu6mAMjsSwUIfx47YeL3SKQI
	EW1ki6we8JTxMHc9rcImEr0pc05d/He5pr29eXBvx+iiwhfVduI1zudwJkWefNmM
	UCshMWgcXCJB+HXSfxJaAnQK3/fyebh7OCaNCGtkgVvyNsvW4wQGWVndzuymlijH
	2XfAFyzZOFVuzTThj51+V/8yIe+J5SuMxm8Zsperhy6fu00QO36oJwmG0FURpSOR
	G61l6hxG9FqDE65AE4K6xyyRZvhTPrYPn3278rVPgJ/s/R7BL/SWeov33bomxy9V
	1n6b/GTupYcEbYj+Pb5WtjY5lZDuoltukBGMtoEYqqns3A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0s2q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:30:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72d089b28e8so1134065137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782142250; x=1782747050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTLskQpAxIafqBM4bwRBYXlgB6bC1qqplPkstd54/z4=;
        b=JWZEVv3aM8slYpBhxZap+aEDjX8AYTt6CKYYVsrtwIsTC8midQ8ExyXMWpCl3nV1Iv
         qBP5zAHZdxa9ICJz13aKQ0P+K7JHDUduitSg1QU1b939j/hRfwaPtdDipcMYPRDH285k
         rG9Z2ZBYZbO2txNj2vgQtl3DIMkFvIhQuIaox0oOgVZbPmI4orxx/ySn9xMvDpCmEB8K
         8DN/VPUJ6fLfPGy2EwJN+yWvu6j/Zu0xlIS3GOHn7cPRFQ4SDvbGnV1Y8jS3iR08PAQA
         x18F8hPMM/5a/r2WsJRZ0+h3tcIMGWnKlQW/1JghuFXzf+Q2u2PedXLVNtCOPyrmqNrD
         BTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142250; x=1782747050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTLskQpAxIafqBM4bwRBYXlgB6bC1qqplPkstd54/z4=;
        b=ieyuP+xOcbbH9BAKxTDC4yCErIRBU7Pk3Fnr0PMRLcprpaTN8+PtILHXBjCQ4fC8MX
         Z/r4nKhcVS0r4eP8s06lCz7tC/6z+Hos33gRkrj3qlQPUXp3LEKyKiuZebt0bZfyCVTh
         kuKw9Nk3q4O49uSzOmqshspzCoMpQy9gZELcFwRV7RORGi24BUcBolqHAetWl4JaUclO
         qI2ojXcI8ksO2oQWcVSHgcVih4HnZJNF838Ks1yz5tmcLkz4OjnSkG9BpEDooUYpYbdC
         Y5FxIRSvign9PbJZ/HirBi66QnhTM1R1vvmwixw0j65caEdCURQoGkCsXXk5eivXTZ9N
         TrnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/43pdA2WmSqg3zRChraHared157ahMUeHofx5fioLBwZ9wrXd8DsOsszIf62TRhW5ljByQXk2m4Ip74OAC@vger.kernel.org
X-Gm-Message-State: AOJu0YwxuC+GejLfK+zMZwTraL0zeZF9cAifX7o+0Tg8NvQCjH7mB2WM
	fPm7V4zb81kDVMnXHtPeufipeEU/qHzyzt/UEYWkWRk+NNyOPA4RKk3CSQ7JAoZs6zLt6TbZqiF
	XgOaC+9N6kkZ/U/DQiZKQhsAQDxz2ngydH+mxS0+uuaI6dbfOb/yHR3miwiV48u8B7x70
X-Gm-Gg: AfdE7cn6qQDaHhe88QICFaTOhDowJ1O2nQcvnL5jyazQYj1fBS2e/ZDdbJFoCJjxyNE
	Tr4MeYl9YCz/W4G+IEcRF7VsinnJkcu1h0J9R5c2fpmu64N1wrvsFWDR8qc2v3VW6fHADcyBLd2
	Hs8N1YdspEz6gt+kyV0FEy4Ms/FTTdivwPImuR+3Wh3BZKNKOOeRwqdDa5W+r5njKolmiaXlrym
	NlxEVbbefu6QXcjgLEY/PE6KwNgpNlQ5eiMNbQgaA0ilIv594KcB62J4SaJjS42k4b2W6liIvVJ
	7Mf5pYOuwO80BeKb9zidCo//ehBXYFrq+3mlx6fxSOXJCjaeuT5NyPH2YGRcwvlHNZxTO3Ag+9w
	61RXPwy4fo7hizR5Z164ljeF9vnlE2eaWSxRbohm2ihdni7ICt7FdZ+N5hJAuCzCHY4qI1ahnTL
	DWV8UWaAvCJZFEcZBtmEodsCX6
X-Received: by 2002:a05:6102:5e8c:b0:634:420a:ab1b with SMTP id ada2fe7eead31-72a1f0aa661mr8171064137.18.1782142249997;
        Mon, 22 Jun 2026 08:30:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:634:420a:ab1b with SMTP id ada2fe7eead31-72a1f0aa661mr8170944137.18.1782142249322;
        Mon, 22 Jun 2026 08:30:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c3c1ff5sm1783461e87.79.2026.06.22.08.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:30:46 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:30:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, Zijun Hu <zijun_hu@icloud.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 02/13] Bluetooth: btusb: Use & instead of == to test
 bitflag BTUSB_IGNORE
Message-ID: <hstcsmjqhjt5pypnwc2hlht3jckoallc2x7bs6f733ltp6latr@onl5topdfa5y>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-2-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-bt_bugfix-v1-2-11f936d84e72@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MyBTYWx0ZWRfX7Jvq3R/q5DSP
 etjPc5G7brCYQYHQPhjeyVRyEbfThIH5ZnluTAyy2QZo5SMZZaC1IyfFN7btiAEgkeYXw7mMtTG
 wCPDYbkhbmpIpv1SswU65flAsfi0OHc=
X-Proofpoint-GUID: fZ9ZtklHOPddquqfcly1KGkPi08PQ_JI
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a39552b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=B5acAE-UCJMUPL_hvxsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MyBTYWx0ZWRfX4ttzdKIV0MI1
 Ep6VxpFqCUgFvP4OEfgEqZeNKVOnZcI7CtsSB2r5Vgbvs244X/7yDDhNebTynZDG+opN3wQUtfI
 f0RQKN6XIk8EwySs//xLxutllgwuCbuqP5qC7+nhS5l8T84LY/nrG71IMwD7fhLfTXQR6VCJGcA
 169JoaK3kPFfX1TM7Cv3nPLBJIsqSuqGskrv8xN9Q466Lm5jr+t8lVrPxoF59/9vp87JZ0BH23P
 wFq3fnUAv5OszbuWEKRRkZYTTqrK/wf31q+JNzYoyahfFtSGKOD1CC/8B9ZOZzz3qvpsgAMdsNs
 +iC0dUnYdIhAsa9waCLztJ/yADjQkKV+fWh6iS5Nj/3hzI2Lq3k4zyF4bE8Gljmref79zYyuclc
 Cno4GDFJLPX4Tk1EK10aH9nr7+lmGXr19Nu1hIizXs3VRMH9PmIqCcRv4iZ33tSieFpSn70DTQW
 hPsU/zaKNwpBGdIwnhA==
X-Proofpoint-ORIG-GUID: fZ9ZtklHOPddquqfcly1KGkPi08PQ_JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org,icloud.com,vger.kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,onl5topdfa5y:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489D66B0C9A

On Mon, Jun 22, 2026 at 07:52:15AM -0700, Zijun Hu wrote:
> The driver_info field is a bitmask, so use & instead of == to test the
> BTUSB_IGNORE bitflag against it, which is consistent with how the other
> flags are tested.
> 
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

