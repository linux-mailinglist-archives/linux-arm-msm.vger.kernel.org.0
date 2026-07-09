Return-Path: <linux-arm-msm+bounces-117949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5zKhLll8T2rShwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:47:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 053B672FD84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:47:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VlMtUsUy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cuXhdTnw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0BB3305E9B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E52404BE0;
	Thu,  9 Jul 2026 10:28:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A393FBB5B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:28:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592927; cv=none; b=A5ilRaS6IzCffGn9vs1Uent4NwV8KErLI9Ddf5dEtR18geNZu1MFJqVDCBL3MeonG3P0Fee5d1zNVoGQtJAoJ1+/EOHnnmBIGp5P2iNzqB4Tb05Ayg7VWJJmfCOLBhA+BkPtJuUet7enmOV1aUn5wb7X8yag0cFmunLPACFNt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592927; c=relaxed/simple;
	bh=mtrAGO7mzZ2k7NrAqzt8XhUVSlLeHFbE9hM1FDtniM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtYMhdp4IWu8QTykX9pFlncg56CUY0dAPx9uXouLkpISD7gpp1VXTmrGmYae3FXQNNIgflo2utvRhC05ESrGKwCucH6hxv589XzUIgRKgulvcIdmdQA0Eimw0/1UnfumtrrhVdgIiDF7pINhbbZhhTF/hT3yU2zmgXpTuU+AQlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlMtUsUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuXhdTnw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANXU51401944
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N+Mu4FsQBWM5HoD7rwag4nRk
	lNeKKvXIE29VJ8JvlH8=; b=VlMtUsUy99usAcVIQQl+wLN47VrYTf/g7pxK0RxZ
	ak+N/6ud9eEgb5TONdb0MYyN7MtwBLy9Ta0x5pC/6jA6JYJ+xnIepiL7KosESB/X
	LsqGVWzIXKuXNmBQD2cjXnubc83vKw00wOuIv94n4oRxSpCvmgRPhVQBos01WAqJ
	sGd1k9520cfcXQM/j2HErMELKglzqa28dWNVuwPcDDXTcd6jIWRw/cR3PFfnGkdJ
	MhABZ1KUw6KBibVQzUI/BOokWwPwX7asLVZ34z9aMqrU+5qAmxEId4rDgUo933WV
	RAuB4XY2ZurpzClGuzq4qIOGv5z1DWWx0tEWc8LBuDEoyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydt3rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:28:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7cb9f24so394439137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592925; x=1784197725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=cuXhdTnwQp0kJu3+qHmEPEUV3Vaj1mSwHFGeLV7owBb7ReoNeXwthwT9lMpC8m8XkS
         HtdsJKhWZ7qc1mglyhk4fPDBnJ5BsifpPvVP4wiFX4PwoUykgfCuS0OKVB6IHOLyQzUJ
         e42kmyzKaDso4YTq63MAyVmiEcSX/UtyjsfJan4rf3BfRFW+rsGBpaBin9xrFSG3vyBt
         mxzkxWl3liL+6HdImW2ekMzZVNWF0YosQUxdKFyyInkxjM5lmL9IycNdvZF2W5tsRhPG
         udbgz4BaVXijUFRFuMTKeByI7cNmQhbSZRnwGwWjNGcChmNBfJuVl5uzbaSd7KS617L8
         96vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592925; x=1784197725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+Mu4FsQBWM5HoD7rwag4nRklNeKKvXIE29VJ8JvlH8=;
        b=mR/c4G+lB48KZ9z45oqcZtaoKgaj2dO/RYGDMR+3wMjI9nu5dThu7s+PT0MrgfK72R
         sDMFbIAxKnmbqro6UQhI0dcmmdWlVvK09MVBBH+Hkvr22zzll+1oKG5/B2685ZvmVnzo
         d59c+OWa5BblqH/11QJPJOSI69vC9P60CxwhcVrw+1ByE9dqVgQQKBW0G3EnBOaJVcqr
         3eNC5+fuJqwZphfKku18oMY2mHZymthne7Z4pCyasfkwkGluwYootsy5VOsId6dGbsXa
         LamUpTDALgQy7z68L8rBnZY9HFKulVb9mfamiTz3w7PJeuB58azmSLNcvN2HMLeFZgsU
         AEBw==
X-Forwarded-Encrypted: i=1; AHgh+Rru8ZfdWhVOEpajAu+bBpCzpvB+o+x8jMwIlSGJL378puJeJbhjhDHyQtYh73XHEs85k1JpkMUqwpyJbs2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5cfR+dc/5ZuC3nsbRb5RObU7gaI7KrfxSfgr6ixOJmlQAEZ6U
	slJcymqhXzRqYI91FQGu6xQckeF1K4LBDVPajBI4YvXyBURuXtHsqdOCprqRmk9lHrUBHCO9BaN
	xKVeAwHgKNEzxf9Y7GFq7eG+rW+oRuOao5azgICRlzMJ7XlKIS9L7aWzLRxlSioeOM60N
X-Gm-Gg: AfdE7cmWtl+yH63jfLc002otb+6cWZWnxnpu73bMzIe3Uq6xxBl2AcEKsWpvctEp1B6
	2oju6jw4aGkrwCZVzYjUl5M4PbNhvr6XD6CC10tyANAFtq0+QFZn2WYZpMjdQexVKCGtfn/PeFL
	KIWsDawhJ3rL3/+0SZfJ9ZdThlQm0QaHGlFazvZgWyi8+pXaPlVQHsWr6aBTFnazFRpSXNAGRcs
	k6pMuhlHHTGF3695/FtUdTwRgct9csZLj8beL/sl2+anC+pfcznDFBwaYtQSgogMZG1+ByNVi70
	bfxSUIMGirbmFcHD1P/gj+vz2zI5b2SbANeZs7qPJ8CTtPmVpPD1tO41ychoN4ew6Cogd91p+oq
	xiJnVyZt0CUNKLsk5mKTLRcqmxcBlTc8Cttd3JhAg9POJg97r930bsJa+5cEvVM+u4B3wuxKS8e
	5NilKPLMr9nxmTcNXXT52YAAgY
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551390137.9.1783592924845;
        Thu, 09 Jul 2026 03:28:44 -0700 (PDT)
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4551307137.9.1783592923132;
        Thu, 09 Jul 2026 03:28:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00c76dcf8sm1613638e87.39.2026.07.09.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:28:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <6m6oifeecvv77xsbbstkkgz7k5qse4azj3rbbvi47n2wbasgt4@7z4zgsiatg62>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfX+1WM/CmhtHX9
 zNugUdOENA6cl2MiFGQF7H4ueycpk0mBqdf3y5POltmLjRcWunZHJQ0OHrkRoDsX2jy3BzEIKv+
 TVOV3I4uSk5LozY8oYcEFrzQGhZf6qo=
X-Proofpoint-ORIG-GUID: YgVCfihgb_PU_CR5pFuEZGR-UVOsGAdO
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f77dd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TegkrtGQps0JBSonG1sA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: YgVCfihgb_PU_CR5pFuEZGR-UVOsGAdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMSBTYWx0ZWRfXwL3M/cPEyz6j
 tMi2Y6LYkCGujacVlR984Vxi3evhpG4bSSYwTtqbOJdPn3vd8MKnr12nYxD6zDXXErhTuZXQyhR
 +NTFFP3sjGa+kZnKuVWJ+6oP41J5WpCgajHE2Yulk9TmmEcFVjH8TDNm9jjIgEOUh1X+MOzgT1c
 seiqn1kj500nvBE7Qdfh9MkSRy34B9rESlnvAoyigY87CxDRi4/ii9r940gTKcWa9PzSIBEkpgV
 M8lKbHv5IMmfwkcOGkiMIhzsgQvX5Rlk62yMx3booUPhWguXczdm4D6BQL7nx9j1jBkzv6ik/dU
 Q28uq2Zn18eL3tBQiPnGImV38wRUzyZB+tvl7e4Pidm/qj7fW3PIfg43Z8g3Cea/Q1XcqvKKs7C
 eDsKwLgG4stuneqJGvYEXtvFHy5GpqUfV3oY1cAk97PS59N4faF/pyIbqmQLRgIfCk0Pjzp3L48
 uCzAU5Z/Fr8yd2VWe6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090101
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117949-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7z4zgsiatg62:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 053B672FD84

On Wed, Jul 08, 2026 at 11:55:07PM +0530, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
> CSR resets on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |  10 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/audiocorecc-shikra.c | 809 ++++++++++++++++++++++++++++++++++
>  3 files changed, 820 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

