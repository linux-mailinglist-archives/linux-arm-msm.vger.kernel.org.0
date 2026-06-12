Return-Path: <linux-arm-msm+bounces-112872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pxbSEQm7K2r7DQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:53:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2654677781
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:53:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jua/5bgN";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MhguBMei;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112872-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112872-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B1A1316EDDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AA02F7EF3;
	Fri, 12 Jun 2026 07:51:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B33E1736
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250700; cv=none; b=sWLv0P2tIHO8Ld0iyolnshwiB9LU+Xvm6K9dRnEA67PPGCGb9Yip/LiZ3gG0qlnHhfev/J4TTDKSE+3S4fsaPmdKejB9BJI31f8SclzRtfMcVDrIjRRCDNKYEDatXxHkf9rFnQMHo8qvXBZwMcbSTNW7w5bYBu88u+eVMk+FPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250700; c=relaxed/simple;
	bh=NPuKeNbPTvcVpb7ngb26wQ9VRTuyAsAMPzqYxepm4ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz681whvTuyuzCUfEK1cjopI16tR19ymS/2SemZYcgO/q1ZUzFx4QJTagM0js3ThOaWmnZjy299KwFE7qGCb7Tu1IB6DSRJdmg1Tch+7YQ7EZ6wb6bcij0BbXO2rhSn8+KNUvR98mHlHHyiSWySYaJgEmzDnmG3R9Hr1MS2IU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jua/5bgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhguBMei; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39cTc2476238
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QbLNJ1CmnvnZcLpXFuJz3+LW
	dd9OGVyN4S8wDwD2Jq4=; b=jua/5bgNAt0lPCRjQ8qa7iOYxfUWBr7EpI5MscJA
	y5eRX2eoO+zHpn/SVqoA5UmVWu/EjYS2EZt7yOB+FfgGDuUJGfRnQIQNYL+hqg4H
	q9IacWxaauxP7ABarfZhsUwZb6Jg3W3trnhTA6lEF7R8SrT6AlzNmysdOvFQiL+p
	X0vJGmtaJ8hGKoEjDgliG52Ew2Nt0h2EZEZzlY+wy4aXoJg1ny9SzKdnC5EQXCob
	zJ/35/XTxz2J+ytPx+BHqugXcy5ZEGPbmSXvCwev3k6A6H1IhXKGzSxalxoFVUSe
	TEpsA9vJtDVnLjRbcmKHmR+LnD97QSWBpUxsvenM4294Yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5t4tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:51:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177bddf6e0so15495131cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250697; x=1781855497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbLNJ1CmnvnZcLpXFuJz3+LWdd9OGVyN4S8wDwD2Jq4=;
        b=MhguBMeixI7IZ5f8RgPmR1U8KUiG2fuRR2N1e5NTNOCW023cMsmJY3aYbTU/zNevxK
         7dQok2cMAwrtnN/KJnBa0SCq9TBRvwX08iuIoKcloU17EmHLtUONdyozq5YkLFJUCcrI
         hMajRGfCHHV1MgDNsKr/C+RsvXDXoNr/fj8VmHPciYbtB0ds62Y9fNx/tA7i0Lz5Fvbr
         U0Zl2/s0MiwIpuWl1UIfhsx3mVi51VdVOuZZefIOvXl9DbvgvmulHKDNZ9XWlWBT0FLo
         PQ/DinE/9JlQ/MnyG7Bkn6dJmRv4QF437RxZ7XAY4VK6ySObbHhBLtOYvcCtxGim1Rme
         fwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250697; x=1781855497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbLNJ1CmnvnZcLpXFuJz3+LWdd9OGVyN4S8wDwD2Jq4=;
        b=HyST2ziBXhKVzI30LWe6AwKx+dpiIqcjE5f/l0hHVrM9IiefISGRMQVywvEE/sd8vr
         gIpTB3nhpMLSVdTsqupMBV84Wn8vhNzpusie4bl/S8oWZ6gnW8ZRNWt0of5ur7Enit32
         15hfpH10fQfQLhX8L3PSW6C9xh55ukYhvn+Mj5nobnhXyMHmSaCNC1J9Um8v3Mx51JNb
         Skb6QxbypBNKxpkE2OP8VNXuKx8ZPSKz6WP6rYHQqNW9dLplkkiv6X+iyNAkFUcpmZe2
         yRLlRkYwyyuUb7GMMkFwaaF6DyZEtepmg8WkBUxcKJFFjM8jKINR5ZPWGMjsS9vBdtn8
         H2aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IvqNgnsWkV9GO2dldxmneeIwv9c7LcbigOgdnJHTeAia3g6IsmUaf+pFR3UsmjF7WVSyBQZ0qZc+9vQuU@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMV5H8WkiUKzeTGfUUF/SrP011ue+QbztnfYo5ekNEpTdaJYg
	mAWRf4Yo//wJ11zvVIOpgyD4O5oOqRanqo0acHazHEyuEf7aDznBtWGjB+eJu3rrG6PZnXTy9KJ
	/gDosZz9AKmgSgIk4vBNqycpJBNioG9TqYsZT7IXssRQs9WuiKp8q0Ly7psSs/D/G6KmS
X-Gm-Gg: Acq92OGiyYhpRp8FUz8l/9j/zgg8AfV5Kor6rV2WkUm+m2UnVCPqyfwCpvnfEC6faCg
	+NG4cfK8NanEBx4uKeUlqdu0fkG1LNw+vwJCaWXsNMmPxXqNm8ZuWCFqjvAmWJr71FrCIZXomIV
	QYJMVzftCLitDHiX64FI81TslohT/Hl/Imf0dWHjRhXU1Q/tYSIbUSfQJfe/7uHc2YTx48bb5Mn
	0VBylf0Xhg+aFtTm7BiF5GW+zNyJBtJMDqJQ693ApDRv+Uo8s5Qpra4XnxmC30XUgAfMrq0wt2Y
	/5SQZuZBx/zEhJ99UFU23/QMbWYJ61UQ0qAg+t9wYv0g4MEIc5Mil/7ryajj0cqNg0ybb5IzObG
	GlwbeOevs48hTo+Pcx7w+ib2DzB9TJv5Qb1KY3/PiCfs8IrEgawCshqtQEjqItm8NmTImYjcmJD
	muVkOv5B7BUGFRgZYK/r5w1P6fGodKPZgJ2aM=
X-Received: by 2002:ac8:7f90:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-517fbe615e8mr25490221cf.20.1781250697440;
        Fri, 12 Jun 2026 00:51:37 -0700 (PDT)
X-Received: by 2002:ac8:7f90:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-517fbe615e8mr25490051cf.20.1781250696994;
        Fri, 12 Jun 2026 00:51:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b3d0bsm316257e87.71.2026.06.12.00.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:51:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:51:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED
 flag
Message-ID: <3kyvob7ovt2penl2w3d2tfjcan5txz7q63jdvnsbpd3qlz2ipd@zhctl2sk5w5s>
References: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-ipq5424_drop_clk_ignore_unused-v2-1-15240af073d6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: szx2zKYDoxaDnaqQyeBI42LP8Dwu1C-C
X-Proofpoint-GUID: szx2zKYDoxaDnaqQyeBI42LP8Dwu1C-C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX+sPAaivSPJVk
 ULKwR598TUogqCe2dTRUlF2BNf6BE8dF48FLSde7pYDhemerB+FA6d9vggJzjjhfS7jw3/wJFlO
 dACW2wfLRGGHQGOpBkCKy5SItU3I64w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX4k3rxQaWl33w
 QibWF1qTeekJiPYutn1iyvobSru5AxX51ilXVd8Nrc8GAr2Bq8g7KjgRhooBuTjfCOaJtNEn13U
 wCs+Gco/ewjf96jpcN317RJ1VoY/GxpcGkTP3RuWnCdAE1daREzkCsKZOmzLf65LNnIIsjpTC3H
 CXborRySXgmtio04SG6tL+AJheF/IVtzEVbjiOuEyp87h2XyY3bbrxN71RKSiWlJFqNMNQjOMrM
 SfQCnTd8qPGbYn3rauP595pY5S/KbpMdO5ohmzSYcwnopTDjyYWeyCmba2rM/6Ik4kIo/jCsCkQ
 EpM1/8FB/LtkdcAG7Apj1Ta1tpGBwReq9uW801v0Clk2Z+nKYUppY9IV0S4po//a6rrQvCPZX6h
 yiSLDBCw+iR/el9prkvulEwAdErFBBo29lyz7V4C6wjiOmYnRxTg7ZWTICgPQJl+M8uDE6n+QRQ
 I3gmLknRKYHJ7LnCK2g==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bba8a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=20KFwNOVAAAA:8
 a=R6xCDqHOQ7rDVscz_h4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112872-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zhctl2sk5w5s:mid,msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,baylibre.com:email,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2654677781

On Wed, Jun 10, 2026 at 07:49:17PM +0530, Kathiravan Thirumoorthy wrote:
> Since PCIe and USB are enabled and consume GPLL4, there is no need to
> keep the CLK_IGNORE_UNUSED flag. Drop it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rewrite the commit msg to include the consumers explicitly
> - Link to v1: https://patch.msgid.link/20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/gcc-ipq5424.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

