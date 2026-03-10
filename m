Return-Path: <linux-arm-msm+bounces-96474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIFWLTGUr2kragIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:46:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F7244FE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AA9D302DF44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8690B2C11E8;
	Tue, 10 Mar 2026 03:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+CbJ+nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a22F8Eq4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333D3939D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114412; cv=none; b=BG/yT2+RFHRo9x453h24F6DQMH4QR3PjCW7zP9ozMDaQzENZ2r87aYZBBboYl7QI8OZxEpMaAbVqnHWlv1Wgvw7icWH9fGsWz8gyEMzg86P4E/IhUPAPMJsEJ1Bm6MAX3J7tqkrsGXNosrtS2xeFStHjPyNR7h5GLZqfHxGakio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114412; c=relaxed/simple;
	bh=EuD6g6RNFYBCMCyD5nCeQMTTjq6/Y5prChgeatFAeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyLOtZ4agaTP0KQGwhs1uBSntBWi5PwDtE4h24DAmZRNVsz0fnpQJo+NP6FOd/H3p+uh3s2GflnpALy/A73X20jYBybdH9+N0TiBgOmeRdY3pEDIgBaVzkIaornvKiCPDOLoYxX+RrlW1j70CkfZG9ODcusCWMTZgExcvVn1dnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+CbJ+nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a22F8Eq4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EHKZ246848
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1O0unU++X74+aWtoWQlyW8T4
	RoRx1uAMlD6DQ2sKW5g=; b=E+CbJ+nleFqIKvJpALTsC84i4lom6w9vZCob6K7a
	qUJRs0L68MbiYaUgJYhAJKqRpSSGA63OKBE2/+Uk7HxiMbYqZ4Hs70r7F5msBFqi
	gaSm3wvC1rA7aa85MXlAZYe78JqhPtUJ/1ezopzOJMA7acRnmaCKMttydWRdNnTx
	yqMybGRzKM4yhjIgeYmcPvesyCf/ezQQxLWbYBpKq8ll60g0wO8JhWB849bMh48X
	RMQoh0CrIon2dlRWzuf1vjVe4CoKMrIQFpEJsR2tD+AyI1dxlsXLnzgMVhoK+wFk
	DrIXgYTbUl1iGbW48xpHszD9cwSc0vn/DuFhamdi7UK0cg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8800n1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:46:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffcb3a10f8so27456162137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773114409; x=1773719209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1O0unU++X74+aWtoWQlyW8T4RoRx1uAMlD6DQ2sKW5g=;
        b=a22F8Eq48EIN91iMQ9+7Cb3JUaTDZiHEXP2CqXm/Vt/fJwvQoNkl/P23BdJ0fiEFQo
         Mqj7IA4AH4jT0DNEyu05pyzLaTtseXKcfhgth+UUZ2WQOh6XnqcdnkAwMwv7MCRLCHDs
         thijcMoxlmPsv3M2c2CE7GJb1fOe+BkxZXjJbfNqXPLmYFBm7kJRrQMHWDeRmcTAFa6I
         ciVRVH1e9IHcuwOcJzHlPvv8ViG0AB6Gu8ECGkk5LWZD0ztpgn9WdtheO3BMUp74zP3V
         pIQKMuZCUU5nIDOocOZURcIELKkAOkOJeK9lUxIZ54u0i258wOZzNyi0+yeZ5v2bbbtl
         7U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773114409; x=1773719209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O0unU++X74+aWtoWQlyW8T4RoRx1uAMlD6DQ2sKW5g=;
        b=VQ5ie6RjGhN0VLHIuHSV0PK/MtnN9+rJmRnWQJx99DSPVk9cosPuegzPMs+cAECB7s
         nlAWK3NL7iqqr93POgGbXjXBUNlUkrgjl09LET5xX5zh5gZVYbJ9xGKKcHHlV45Nm5wV
         h9dM+IByzTYW0ezRPq4p19atvvhojJAps+MQ0NvQPsWZv6AxqrJMWqhPYAOvYVOAS4KS
         Zqp5tTcpxLqvwcJdpdPWjxLDEh9rhweTU0aDy/OYbhNoIHG8ljxDw1/HJ8PahyWvExlF
         XLcyxvWG5z8bWe15NQlMzOjRNT6HWR8iM6ubbINLoQkTNJzfagx4/9/xbreRSP7bzet7
         d17Q==
X-Forwarded-Encrypted: i=1; AJvYcCWk7k+ySWCcCQoVsxiVGh7l8dWoA/0o43d1uC9ojEYSzep8EJYD1yJ9dFC97OQHoQGAUyHg2NfxLJiLYG4M@vger.kernel.org
X-Gm-Message-State: AOJu0YyYsvVbGz6avOZN/0hD6tcjl900kRtTa4kIF33w79cj2BlPgZcA
	qxLcFleCebmtFMVAT38LEjr9Wmy+0igNoOLKMXqtST+B0DEUYZgSrEbhJmZVMxPNcQYZjmSoXDY
	mSMs+U0Wf6H25j9Oak5zQtbXa893pxOuu0GmJ6enaaKz7CTd9aKeVdz66u+iLSumv/bQlntLxRo
	yL
X-Gm-Gg: ATEYQzxsZ9wtbBPYHGO+VUFmnHBJRBqM1khOS/PtL8K3H7jl0bwJROuxaIi/8rQd2kX
	DACz4p0H3ipA9VwH+8uD3PQj5j9OxoACM4VPabDru0ax7poWEKsZ9DAiTh6kvlLys/LydvwJZ0f
	AOp6sic94cUIzBhTDaRyJE3M8za9iKZ8ro6XRh6ZfI232cKioGXbDjs9P/RaszKNOodxo/KIB+N
	Rzzcs03B2g4a/XZSLgiSOlLOZdQHHXjlXkfyb5XGiJrDtVE5E8Sg7aJlaGN7se109O+1ZR5zG5n
	fp8HMq+6I2rzbZMuKH5fEnS1vai50WpzEeKONAYGMUvOUkj2rCJtuO4KeJ9gF88odol5C7cZ+BF
	r6MYsAwwtVMzGWiuLd8U4jFLGagd+YbKxE9CPaflJdJvmhV7niKKiGs4wM+6XmRQkBlj+DwUXZ/
	xi6uSepyv5glaWAZ5pEwO9JQa6jfmrucHnPIs=
X-Received: by 2002:a05:6102:54ab:b0:5ef:b0d3:295f with SMTP id ada2fe7eead31-5ffe5eba430mr5759729137.8.1773114409164;
        Mon, 09 Mar 2026 20:46:49 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:5ef:b0d3:295f with SMTP id ada2fe7eead31-5ffe5eba430mr5759713137.8.1773114408786;
        Mon, 09 Mar 2026 20:46:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1264sm2509461fa.9.2026.03.09.20.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:46:47 -0700 (PDT)
Date: Tue, 10 Mar 2026 05:46:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Message-ID: <o6qyvhcmozixpj6yph6dfd3ddzvv77xgx73setsuq34hnmirf7@ovnrmqmm6liq>
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-5-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNyBTYWx0ZWRfX7Ff5S3Jz3vot
 31C7+i/WvxYSjp7SlEHUpszV+MR+E+GzC6vrJ8xxAy9/K5vR6DTWZHrvkcI6pIcI/Ew2xZ4eAlp
 jHoJI3AZIDyntjNitOtexsQSv9DzrGsY/o3TFkitRVmgy2m5lAB3t6V62LpaFJBQYUvz5d8Icdr
 nrLKUdYUN6LLlJ+LAEt601Upb3FEWPqnUunrHgbhsWj+RmETNyWtdnYGGYuvgNbPlf6Csb9PKp4
 XFCcyGmONEGd7ESFIKdEDrtcGlbVaulbKBeZWI0vSfPqmLpsvi0uCh/bs7YflnCMtsEaFit6VLk
 0Oq6eG/yfMZ60eIZihmdrOiXoefhonllK0J6wzO//7TNEPIxe/H1M2uzqHfKis5ABlDnbFP717H
 GB1hNnD4AiEoZGOERVvplb494mdfYhck4mAXaVxy0OeS5/w5H851DPm64U/6AHCL5a+nQNOrBa+
 56AIQJ8O0dMkjM6+o+g==
X-Proofpoint-GUID: 2cr4vOYzCD-ZPoO5WTbPVvWFN-odH3iv
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af942a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=TIhwJpUIZt9fiVsXp24A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 2cr4vOYzCD-ZPoO5WTbPVvWFN-odH3iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100027
X-Rspamd-Queue-Id: 780F7244FE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96474-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:24:45PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has a separate TLMM for audio pins. Add the device
> node for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

