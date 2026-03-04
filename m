Return-Path: <linux-arm-msm+bounces-95347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GaMGmFFqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B61201D83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05AC630A3EC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C763A8725;
	Wed,  4 Mar 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piUIV+Rz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi3E2aSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575E3A4F5B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634456; cv=none; b=Y4nJjT/SmW/0PC+CALf9xbMpE+fHqm+mSvbs0ePB2m9xI1DTaML4oJq5Up0FkKmRJQgoUHPb71C4cRtobPPZrAUFrc3+ZusZQB0nmHgHDc0338V8GE5Llk0ShxkD7hl4em7UUR36Zbx1PQtgQcd9w0DrwUTxBQBent+1mxALGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634456; c=relaxed/simple;
	bh=bgCnnnFl8K7xqbCcLxWjTrJVxvJNP3DYLROghUWAZEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAhKvsBXplQsn1UmcKcReTDJxIx6vq6jrvEMPrdBZad9DnwIx1q+VD1pGTo7asE2CqQlDkTq/a7D1tBfipa0pLd/lwtAddyEaLnIhKJKJg/GaqcG72Amq6FoRwimaaCaX+FAnH8oWjx5o22OBQ91sCvzwZlcIwzVN0DqgT+Fp8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piUIV+Rz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi3E2aSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DnDS61203263
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=; b=piUIV+RzqTIZvevx
	cEb6iY6UwXKejNEhYXzzF7jKwZNYMcJiKWn4v+5/Bu0ACVwb02+bxJLvCMyV7SDn
	Q+nlLJe8cA/Jt35i5lCE7V0AqthF8tT8idKDlA+Gx6mySjxWt8+Jnxzbd4tHN0s4
	3KXj+6uvLCAHGvP+THeD0W/iD0ffBTge/0ZCV6p03GRRM9oD+DRNlbvzbxhgIkpd
	mHE9Vs9mC2H0mNvPhgIJEdyo7jjkA509fZpvJHu7vdVpmpnDDEuLxVi3cx3+m3yn
	Tbent/7c7x97CwJBHz7Y5g+mY9v+t4x/RDv5A7Ys5Rm4q1RCQ6sU9FfeXgTz0Sx+
	RJ7+Lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1h7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:27:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso99762385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634454; x=1773239254; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=;
        b=Xi3E2aSm63uiQQBt9NopZ4q7tuHd5eOPqZEy/zR5UljERHHklui9tlyrpqGLlY0g+X
         sFr4DaPQi0Tl/nv6lrjAndwY/Hmh0nDrR9061MS9l19vvG3IWlh6vyhF/nizs2GairSl
         37G6ggLUC6ApXgTnLukhVnVBfTk32ppzCWGOpFgJX2H3Fwk+sQLdlXcH8RcrM7FZUV0a
         5sawgetIwHdyZR6VGvAB7GHBO72Lgb4iQmfL496BwPTYB+uEomxLKQ6UcCg06pVp3Wxs
         0tAHBfAV1P82oJIptaaiVufeckJzNKQzf0pVY70rhORQkJ4xzaCP8HdiYtPn4D5Tq+bc
         e9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634454; x=1773239254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKYTPMRQVxp1T1VMh0oOSsdAnJQwKE1xv6nrL63c5wE=;
        b=ZUXPVKLHQyYkIJ13V8QBsj1BS0I8G+Gd1ej7KPiUPC4mxaBWLyL+8WmYX7NII/isg3
         TYFC++iMhxwS2FcMnThq95qQ/FZy+Hz1cCRoSHJvDityTszDFhPhWwzS6GG5Ovwro70E
         KYdIaOQZt+dOR7xx7yH6uT2wgXmO00d50ReB4vilaaMl/ABQI4cTyIgq6UdJfkoKtUiq
         tWzZ/pcTYKOCfZ1Bl/AQPJ0PVXJaqTNrTzmm3yOPPR51fxpTLQuBQmwgJr4tiBObOQDu
         IttB8Inq9K2yK4zcpzH7WqDjg19oZhsTghatYlFuC+6N2HCsO5WfyGcAndTmrCKo+t/9
         A7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmJ4Z6IsG2cbYao62X2haUgFOhgUaGOLj3vVEs4KDk6MuKPWMhm9C2Dd1M0USKaFZPo8KHirSsycFtQw2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUwI9yS/0v40LSl6hWChRbbw9iQhEOC28hJ/KxDQ05CcCRGGH
	EEWSkjR3jB2lrnsFGoFI8EfPmeV//ADwYqeMM8gmGWeG5raZysbp0+DH9Bv7mfVdUp6KTn8H7KJ
	7+S1LnHtmdhoYfkEAlYVRpwQkDB+EJKO+fegHuQ7dY/+i5Qll1Vsb5dJrFCi94mOg5bjM
X-Gm-Gg: ATEYQzxTQk4Eh+PO8KG5wZUd4+dDbGEN5ZaWzbhn86VQGHlnXoFx3cXV2otZXyPz6Jv
	YTFcHdemYo5+A6EjbZvygi0YKN2PVrDd/VMCqAaJ+01QrUjTgAAtslRH7NjKQl2DOsHnM4kMEQ3
	vQTsE4utsQJn96APcqouXwMPyTMphWm301KlTi+YZ/YfppFDFD/VpvmK7sUOSsGOB22s6wevARK
	sVNbNuS5M46Pw8KYfDR5q26JUxEMlMPcszYWQKmPDR1HPBuBTZuH1/zq/eUzyRxnTwSI/lNek7v
	Z4rOyYfbSOX5Vj0fGQe6S5kfRIsUyJwQrDpD5NqpEEe1DxbVfu649dfXHPgLNPLmE82uDFVhNjc
	4XTQDRys1wnaU9F/xAOVFDRZw5WryszZb53WQ8Z3JLUBlDuvrYVfGyNVJUWrtZdfCj6wPBd1QJC
	SM7EfDOQniepNQUOftRDicHBev95rI4IKYLzQ=
X-Received: by 2002:a05:620a:1aa1:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd5aef69ccmr258892285a.21.1772634454241;
        Wed, 04 Mar 2026 06:27:34 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c5:c9a0:ac28 with SMTP id af79cd13be357-8cd5aef69ccmr258887185a.21.1772634453784;
        Wed, 04 Mar 2026 06:27:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12356fe34sm1305809e87.90.2026.03.04.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:32 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate
 setting
Message-ID: <tyrqr7w55isdv3zwk5ddpsqkbsznk5k7iw27nyrgxvclwdyfzp@rbx7zl7xr36q>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfXyV7HGVgQkE5N
 /lq3IitGxN2qj1qhi9yTI5jxZwnjpL73hxbG9acDaMP2Buh+00J1/HuBODapM1d3jS1h0lklbWW
 87S3Dhw/4lw5qUlVqaMMSUX9D4PteKXKcC08HV8KOJ3zpsLpRyCsFkODSJcA76vMrPTXHz3Dwpr
 65NUMhO2p9Z4a/2TuRedyzuI1C0zqNFJqLsi9Ty8OmQUdW7CPdc3DvLQU1r4pc8hoiSshJ7UQSQ
 GUjFQswORRdXFRugUtWsJeuj88uSHPJbxXgybTdbzmyjQXifAUZOZ9MInGlvGMWWwTdIHk3fLMs
 B1JR+K1N8HiFDCIDRtmsLE4lVPlUNApEKCR0LTedVgSPJnBlgp840gTFtAaIhb36U/fb3Kb6RH0
 WHMB3ppapNvuu2Q9roYBar/uz2AGpSemWLoQEreDAnzsatNGTwOw+Ujdy5K9Qh+XUl9ualF8PJS
 KQakUC3RjAmSmn6J2mw==
X-Proofpoint-GUID: lNu5Bw6gocGLO3nZ5tQcnZPhhbCRUAj6
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a84157 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lNu5Bw6gocGLO3nZ5tQcnZPhhbCRUAj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040116
X-Rspamd-Queue-Id: C1B61201D83
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95347-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:48:29PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: f40b5217dce1 ("clk: qcom: Add Display Clock controller (DISPCC) driver for Milos")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-milos.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

