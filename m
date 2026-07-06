Return-Path: <linux-arm-msm+bounces-116898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eqnSAFzBS2r1ZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:53:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F51A7123A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WSVsYW8t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cIpQlrjI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B58D0305F237
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8648641D4DA;
	Mon,  6 Jul 2026 14:30:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726E41A768
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:30:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348202; cv=none; b=HOHUhdBA25rGpSJ6dxsKvKdkFPuMkDIDjanbgBFkYyenaUn9PiiglgUJ4RMLWSIABWLfbBfsoHsApTKgHnPC6k2E1Sd5a0qEsonIYSIIfhV2jpdEkNomB7cHWcjWcz+ZxDq/AlzDVfYBq5ocMlC1oDsqE+ad7cw1PJeTMb5ObR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348202; c=relaxed/simple;
	bh=enUDLqyCCOk7xRn9AsA76+zJeWqf+KEM2d72NcgrCCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTfi4aJ0dtjSm50lvoAs4/kE9oHcfY9eYBiBJb2qiXTXGPpcczScDrWGMQsVcUV5mrLB6SrPovns60yNzDP1yemwieLpgFkb723zuZU8tUeiqQ0waXup2Tbyt88Ge08cyZkvH5b94PyHB1ObMuUUMivZ2k17QNbcCsGEbDSRYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSVsYW8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIpQlrjI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE4f4837559
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xat9AHdfa9iwq7frDekPYVbN
	vuDCv01nEgSbUXVqbpk=; b=WSVsYW8t03yHr87bYqyeSbY+5W5R7kK7sWvOSW1N
	Gbbw1YIbomEecJp79Tv5Tqu26xbwlXwJhRe9dlaf8tvunByf6krmQFIHhKWC1wDY
	55jsYmEdIYi71vmiok8a88NxUEKp6TCB7HV24MiQ2gADMZ1bipM8mRDVXP4ofvp0
	0o2eG4INM5vS+OxrLnEzYO+OAsZHAKaRWQFzjulTvNk9rNz49Ru6LgFu5TPAdWGG
	Hj/d0ksA9YL7NL95LBhZ5aVvWvaElKD6BCVxyHqH67vMQH1lhxUwUAek4kVwFr4q
	MzzyoW0kn9/6DvssXoKxx8nwUTdAewgngc/XwHvQeNgSEQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qph8ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:29:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd954154b1so1067417e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348199; x=1783952999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xat9AHdfa9iwq7frDekPYVbNvuDCv01nEgSbUXVqbpk=;
        b=cIpQlrjIVcUsJ7m03ZmB3/eqEaU9P93iBbcpckeMbnBNn9jXqYK8pR41UO9Nf6xo6H
         wgHNlUoE5WgbLDjBIBzQMLcxaW8/d2xzoMr1qiSHBTolbJOWxfrSSqRSUIssr5xIXos0
         jtt7qaPW9WjNEIsadNYVBXYGHmDGTa/PS1noo8MySyOi709ePn/xbS48zV38TkcJKRJO
         ACwinCU50FkEyn3DAf3kBXveqU+nmGiyx1tMcnB9n4feUXOj26eODJnmULmA+EuN3rb3
         cAnob0LNIX+O27QwZDsvFYg6UpTV3dxwQ/nec3+o4oqg0MzrNyT4AU7JlxzP7K5bQLYf
         SoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348199; x=1783952999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xat9AHdfa9iwq7frDekPYVbNvuDCv01nEgSbUXVqbpk=;
        b=CTFu7Wj08232wyT/IneAGTfOCW8jR5zgBGaFVu7EEmuRVtAq0laEYuz3ZEtxhC1jge
         9/DrlIbwOzcy4DW47Whh33UHAm5c3abyTgsaz+i2LdBxIM08l8M0jfnmHjHM8PYfYe2f
         cPxrmYa0jfrrWfEskIYDs5bU2xvKiAyaGU9myUCVe3cXiUAZYoyNcU/v16ZiwwmicSb3
         wKwMqzTeyCGYbEeKEx0JlRW4GHZ7d6b7RUbhutZcomXqfrLJs5JjVgAvMK1oqucuqYH3
         +wcLOXDDUptbYNjDbbjZrT0rLG+wYxoMgPXKks6Gu/oAdiy+ftC5JK+orKqCmpvzJMX7
         yXlw==
X-Forwarded-Encrypted: i=1; AHgh+RpmqAGGwnCNPTiCeqgGYwjdIYmzN8PiDu/iZE2ZL3DTRP1M1dXMAAI4R0jIlzX2I0dxkCTBgHLuzYSOkIST@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5LFH5vOnV+v+VQhNUM1bkqxkYDcaqGKfnZl/0H8JbVBg1abk
	Zg9W6QBw3DEUqbk4dTpFBdQRm+QJuKphtE60xdRVrdZABJcvuqcNJgdoBLjrTcIGuFgtCtpy3zx
	c+0P5HbbMb+8q6edUL0CuKlV3y7tANx1AeJBXIGHX9wutpwVoekHekXmG7XIYDgZwfGR/
X-Gm-Gg: AfdE7ckAaHmEg51X6ErlWUS+8fnM7OgwlctYHRcxVJsT7gT9DDkVx+ulzk2nnEP7Biw
	aERj79AD1Didc2TaiZ+ROKRmHGeOeePRJx7YL9JSgRggfJVneDstL+sh7oJqoOgdKmgA0D0/BWk
	bopRA4qyqDq6j4U7iBVO1YwLqe+ki33JBP4l7PMVb4bst/Ih7pqNmcbbUY0iwAoL2uwVACO64AP
	JnQG5T4iYdsjH0dCJzxGo9h0kNxtPUkDLik1PAjYJCmCi6U3lJkPZbyBg+TpU2hMzt+w8SBFwOL
	tUVXUrSjhuPydGCzKhsQD/8IRjpoW0OU346T1LufMbeeXfwv63SAMV5ovttZ8QQQWKY0jAgprhG
	qNM3t/Gpsf+p92ce8SRjjByVAGvr2KydzsMbRQhW89C1iUJMsEwg+icLOPmoRbK8FlgRRXa7sKd
	pY8GF8RCYwkhwlMt6DriHWDGCV
X-Received: by 2002:a05:6122:6609:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5be9085dc3amr472095e0c.11.1783348198892;
        Mon, 06 Jul 2026 07:29:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6609:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5be9085dc3amr472059e0c.11.1783348198306;
        Mon, 06 Jul 2026 07:29:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377024sm2923549e87.26.2026.07.06.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:29:57 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:29:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] regulator: qcom_usb_vbus: add register
 abstraction and PM8150B support
Message-ID: <tejtshxer6zb7vmtuuucpizbuxwomx377f2e2zfhsxgm73qpug@vzp2v67ifsi7>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-2-999d78a87b81@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bbbe7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mSBXN4lFcZzbJCLm208A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 7hVWj0DI4qpQSotNOdG2aB4yCjd9Bnri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXzPOIGyC5V3gW
 mH2d/2GUBwF8UbkToCbTX6THbMufZif4g73HSsTDlqTiJjGEQ/QsV07JtaF7unRAh9KrDiKgd/g
 PTQcFcvVJrdHSbriZ6h+ITvPn/UVE6ltgxQedSkUxFxOSXaRi/XSmBhMbrApIVbQN8x7K2aeItZ
 /CZ0wT+uKhA5Pv6lfmrNBtptzy9woL6aw5wWuJArV6Ftvs/7iLHG0hnY1NtOvVFk2L8OGBTjEtT
 LmOudkU2htLItX1atotpJgrQG6SO+WoGIL5Q6ZwI1orOEUYAE0XsU8yFabTHSOj4IF05D9e9AI5
 gws4KCP21ekNytSZxEUTNLvFqjF4LAILyTIEmjGqgEplX8wqIgLIt4yZUMX/bWoks1v8lJROEd0
 DVjQMdirkbS/Zd1BTrTzZp9by14l+1d1OvJlTUMXAg9LNoRWiI9ot7evfgMPPkZS5wjb8/9j+Ru
 Zn7cCcmEWfIREEjAqoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfXxLVDljNhd8VG
 jG0XRY1MY1wTxSqwg1lK3iZEKqFKWyBltffQVvDXvz+qUxdf68a4Pvn1K2AuD+2G6EuZRKGmYk9
 10phG4n5rm57f1K0t/jM0DxHiXnxGhc=
X-Proofpoint-GUID: 7hVWj0DI4qpQSotNOdG2aB4yCjd9Bnri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rakesh.kota@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F51A7123A0

On Mon, Jul 06, 2026 at 06:01:06PM +0530, Rakesh Kota wrote:
> Introduce per-compatible regulator descriptor data via struct
> qcom_usb_vbus_reg_data to abstract register layout differences between
> PMICs. This allows the probe function to dynamically populate the
> regulator_desc fields rather than relying on compile-time constants.
> 
> Refactor the existing PM8150B support to use this abstraction, wiring in
> its CMD_OTG, OTG_CFG, and current-limit registers through pm8150b_data.
> No functional change is intended for PM8150B.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom_usb_vbus-regulator.c | 71 +++++++++++++++++++++++------
>  1 file changed, 57 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

