Return-Path: <linux-arm-msm+bounces-97538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH0PCbcmtGl7hwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:01:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6B28577C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2EFD130E380D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018783B7B9E;
	Fri, 13 Mar 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUiro/jP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/wseKYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAEC3B7B90
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413341; cv=none; b=omqaLMSxuU72YVmjJsw5TfETZ5QJo7UACF6Y2JUWm7QCRVEpLd3pFCLAx9IlazzHfHejxU6BOOiKsD4DeraJyq0OIWuk26DVw1SEHPhLeMydF3aeHj8SLcfrqJeY4VzGSxo8M7aC4VatT4hQRrUKh5Hs0D8aE+86MMbcOcDBnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413341; c=relaxed/simple;
	bh=EPYlJS3BQ7UqK/HqfHhO0wp+Tw6kDkD2eKwfQec4nx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN6FggOej4ViiQ4jlF097CNDePF1t6eujbqSKUyvGTxwVceajZJI5y5MkrmO05WbPZHD74xB45k3lmifaRC7Fzm453lWvXL/GMPoRxBLO5oml9jY6vpatbbz5PWq6lbDWTLD4Pus9nRRJ/biFbSAAxBGtzZV/5FovrqHCe0BuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUiro/jP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/wseKYB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAn9sj2393888
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gWgsTa11z9Ciaqt4kTyHQ0JQ
	xWE9+cmwAfbOnza701Q=; b=RUiro/jPJyUArCWyO5qcX4cNOajPDjpYrIkE19Jg
	jgAKYWKRHliM92JtKzE/I7U/o6dkASTO58QcgtSrB45HFdzU009BnMZY0L0FMjC6
	Czi22Zu3iEae1S89hThZTuhbf9YME5mXCxClZ+VdYDg/DFpgzkPDBFXH92+smaxD
	JkdNYtj3VAIEuFAS5IoRBhzKj6v/R05kRjmV5g41/Nwt8rlgSpQ6IwxEXXZXuY6Y
	zPGUo0i35BnOR8eMQlM3G+iCbrdrvytNzuovi+Dw8ftdJskgN6hBzbLORH2p9J0x
	i6Z+Dj4K3vBHEiCiZB7sb/dFAg/LWUe5i19kFtXQon8cZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8sgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 14:48:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd820c6a4fso1805392485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773413339; x=1774018139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWgsTa11z9Ciaqt4kTyHQ0JQxWE9+cmwAfbOnza701Q=;
        b=c/wseKYB/BkR+2n5YM6ZFRL/EwaP8qDcvM9Vb+Fqi9Wlc41/gCdYT5HFu3ctu97WQI
         WZIa83Z7iF4M54DOekc/6IyvYNmeQQetF/0KUgkOgPHci+D9x/wKoVrlYF+5vkp3FbDt
         D8t73YxGx07E9RgoVXPKkPE6aYlvIQLd8WoHvWl6EgsqMBsxnd8yJNxZrDbUxbN+GbIz
         GuLGCmy1v2UfnXsW2+X/AFIZ/+UPGach3AiyrHtAKqCeysgDMvvxi/lmjI/HEEnZBTyR
         msIyOpOtapGJPVmYoeop9yNE94nXbWLRu+8MxKTK0T35lsowHVP/HO3+XaY7zDP2Vl7L
         eGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773413339; x=1774018139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWgsTa11z9Ciaqt4kTyHQ0JQxWE9+cmwAfbOnza701Q=;
        b=rd0aBQeikAdT7UydmxwB3j9nnioK+wGet8Lv/+C35sxSCADNH77BLxV+3UUO/6SP7Y
         CL3wQLNU+pHjPFiYKjpBhASj58ZlnzhNRaG98BhmMXAHxvtJ59sTw8rBHLzU18B/A/PU
         ME9GVdT2aeCYc2gkT3IeKnkW7+xaUUXJiCJ4QvPoJhe1mEcao2TmRDAJ9hrSiWP37jWr
         qJxdeqTSqGH6PXhbPmnBES656Y3SWimAxdmvXnq90YVEJWre6mfPEV50Q59Pbjdagwee
         6UFcza6YkYjV7dkWxjW8eK0H0OoI/zh83mR/cyLEZP6Y++1wd2RkwmtojuQdQsX+pgKU
         HedA==
X-Forwarded-Encrypted: i=1; AJvYcCUJGRkwizP/NPbdNS40VLPZw8Km1w1gb8FwSmPDzKLvVpRMXXXU5oWWKaKOUMOhN0As0K53rB3+N/UG1XBc@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVUY8rok/JJxjGXPyIMj3oNzp+8Jv4pLY+XW8QKga/FeetN9X
	ndJpxCXMZF0cd0GrAU47RpxZqriumN2ByE+BHiJQND161KsZhO0NFuh3sTSZ1/gsdbSx2iWjQBJ
	LLvmrV+iHa6q/3KvC7f8SCQSZgmCCnoroZ7iGCPT+LxArMWky8j+hdquKfm3ZjzTfWXLc
X-Gm-Gg: ATEYQzwo6pG+sf1HMnbD1dQCSDJeXttWqcE2wstXZ/6zcF/Txew7tDbMuz+7AONX4sH
	c3mRaaqk5ikGHspwVYksI2jAOvQHXZGGIftVrqeL4hgqWCtGNTxu29nj8Ed3PmERX6sedSCMYxR
	o41Jo6P+9E7UIPov72jA8uoMgDlseyZ6o2dZa54QhbOxoGnZhTXIOW8fjDlVSY0yoj5svw+9p87
	SA8jMwAes3IFXYfzfVxLoq8vUXCyBVwYq+Avp9C4+RTabZOS9j0AQUqrYk1V3tivt8TPU1bx0Rp
	Jmgm2VOhq6me54MLt42g8nl1rPz90JIli1bjsaehEvcbi1qs3avgXO2QfdyTju1FvZeXlBOW6Wd
	dMmJCNguPaLjRF6+Wx8BDrhiGae+WoYj/imQQkCvZGVzdQWa7c3bn2X5mDEcHDSeD3gBdJ+AkUu
	NkEGkzRjUCNy/Ywb+xDbb8BuhrwjMsW64qj+c=
X-Received: by 2002:a05:620a:414e:b0:8cd:93b7:ebf3 with SMTP id af79cd13be357-8cdb5b594bfmr497802485a.43.1773413338925;
        Fri, 13 Mar 2026 07:48:58 -0700 (PDT)
X-Received: by 2002:a05:620a:414e:b0:8cd:93b7:ebf3 with SMTP id af79cd13be357-8cdb5b594bfmr497798685a.43.1773413338504;
        Fri, 13 Mar 2026 07:48:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm1574086e87.32.2026.03.13.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:48:57 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:48:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <uukjr4c2uymzj2pe544hn2w5ecpmqle56mir642zieip4ixwor@3uuhplnfo5qt>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
 <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
 <198ccf60-a4b9-438b-ad92-bc4d2cc84b83@oss.qualcomm.com>
 <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90b3a7df-cd02-4878-b614-1499589f0906@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QbQj1gIHMdlYU6gKZ_00OPyOnEEX75Cm
X-Proofpoint-GUID: QbQj1gIHMdlYU6gKZ_00OPyOnEEX75Cm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNiBTYWx0ZWRfX7DkkobgBYFZ6
 l4eYcn3IsMQoyKeSG1zNquYBWqEPZQuNC2CRyOPE8S4w212oz7gZ8yURZitfTHa+v4m8sHjUGfZ
 snrIX0OtMX2xTuNI5aoVbDduZmXfgXK9CHoLGowq1RsBWO0n7iwi9PJLCeHEU0aB2n3Ar6weI24
 FORSjDdNrXE86aPI7MpNkU58GTWRBkUDR5F/hNXuJ97I2rZmWjQYBDnAzWH/1fR04GxYQ11uutT
 jL+n2xHiG3l0OG5Cod+F9xwEsfGY3RNoqrPrzTMv4qlrPl/oI9RQxx2zG00lKkc2V4RONm8hjq9
 jDD162KMRFYfzuzTgeX6E4bJe0+w1bt2u6DAM8PQt20CtDDe3uPDO58lBY+YhQyXNXuKhSmEeZ/
 i+7awThHsxJCIlCaV3+da/TQNMyRtPgqug24VMcSQW4HVWEfMTjNdmsBDgFq9DqCJEJKYhmPaY7
 IZAHO7fhPIVEhntmx3A==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b423db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=RI__DsMP3EwwkOSYGygA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130116
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97538-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6F6B28577C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:59:46PM +0100, Konrad Dybcio wrote:
> On 3/13/26 11:12 AM, Maulik Shah (mkshah) wrote:
> > On 3/13/2026 7:41 AM, Dmitry Baryshkov wrote:
> >> On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> 
> > d) Add separate SCM child device (with interconnects) under SoC.
> 
> We'd then have to probe it as an aux device or something, which would
> either delay the probing of SCM, or introduce the need to ping-pong for
> PAS availability between the API provider and consumer, since some calls
> work perfectly fine without the ICC path, while others could really use
> it

qcom_scm_pas_is_available() ?

-- 
With best wishes
Dmitry

