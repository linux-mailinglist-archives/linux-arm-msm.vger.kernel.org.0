Return-Path: <linux-arm-msm+bounces-110557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HeuDv1ZHWq/ZgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAC61D0E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 12:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B0723232FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7A4396597;
	Mon,  1 Jun 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EewOw9lF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KmncuIxy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508B3B841D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307453; cv=none; b=H7T4MieDTLAgESL9MzCgQ6TdJH1HWn6knBcYN/nl1re67LeC9L64MP70KZUPBrPzpRuw2yPTm7VoO8pQK1Yf2iyAo0C/2o5HHaThxgeZM2DMsIWfI05F7/Hvbl7cPUVocXqqYdfl4VzttZboOJk19i+e6l8T8d15+amrVQj7+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307453; c=relaxed/simple;
	bh=y7oG361cnrAOUGIaOzqs9WRTvUjEFp0UpF9nd514dNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXTeEgBWxVBttZXvbKO1piez8Hb+ahRnJP0piUFfM8sMdC7rCsH/8BUkRRN2HJL8nPvn3fPZsxeHtxUF8sTYabf4kPTcTNaxI/EoiNZY8k8x6M8s+6PT+GffqoLFCJHWo6QMa2K6QmQ62fWHEiWR/MG0E+Y7DG4BJjF3GTOsGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EewOw9lF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KmncuIxy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eJKO1214308
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Injc9GSyk0d/ubCqtOO0wzd8
	tZgOEDPzWZR/T+eO3+4=; b=EewOw9lFT8P09FoXuoricIp8zbdK1c7kKc16WL5y
	1BvitMe/f0IX4zrCOVpFVW+l5KZPfHoQFIGhLKw+OQFLlrlpnb9pGQvZ92r12Y20
	FitS0+tXwF6VcV/kNgcEAulCU+QpUhMGye+XnytLC45ZA3XLHArYH39VEPJpLQ7o
	irx3uIAeKD4HPQXB6SAkw7TSp3YRXHVA6uiACn1XSSND2on/WyzsufahKYV7y5Jp
	mRR1+obM1glemC/O9+RSDxOKN72JgCohnRe5FnKihmwLq9iQZ74Dg2+S+s5u/hwj
	hMfki4oIhK1M8mUAeiNl7HrVGgrWVNAiYhUDbj1RJPXQBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98a31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:50:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d6cf547bso23552341cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307440; x=1780912240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Injc9GSyk0d/ubCqtOO0wzd8tZgOEDPzWZR/T+eO3+4=;
        b=KmncuIxyTvvnRYu3zcpTUff9BhDMgfHLSd/ndTJI4qegu8NHTppuIfFo6xDPv3qjYG
         /E/gwyCSBzP24H8QVJVDqceXNpR/XHyBxadk/7zl4eR8uU/dAIZ7ADN1O+qsFEiTnLly
         J0j99Q4mbHlQpG4nmN+EUdmQSwreSaf/UzffCTuCWIIhBUQ3H3vwGKylidEHXyXXjlEJ
         60r9TVH+DeFJl9Y3Fo8JLwM81GvvyrQqNjzwzHo/5PHMBc8mY6nK6Tpsw0YuuE6xLM8o
         rw64ujmnLZ6rKhCuYRPlkDnDqWEOoUNzrsmiNr9qJpNU2aRB8sTZ9BTfHbZrBdHtqjq/
         96gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307440; x=1780912240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Injc9GSyk0d/ubCqtOO0wzd8tZgOEDPzWZR/T+eO3+4=;
        b=TDdLLV7ty4/Suvoij4fB3cBqiuEQ0rPvqX60dPb9mHv3a4+iQOCql22vBcB9qdHNx4
         kq3a1Th00fB2OGqtKFnk15QfWHcEVNqUG6877AiVUbMQBszUZAnAPalJT6Z1C/z5H5/K
         T+2ubBeJzc/wEucM9Zm0XtxE7j2FDwdzpxsCggYk1HUn0R/uKSi5mtG1cUlLEiUAYfk5
         W2fxVYgs6RXQ53yTb5fhOquRW94RtysmM+otTqVOhZikNEn3niYRFwa4KMjpc4GtcI+t
         xxsOwgXqaPmI8VtsdWmNSn3ksICuH9Sw5iOTlGjeAFfvVE6X/ubmafvIsYHc1+kZyMcw
         YLbA==
X-Forwarded-Encrypted: i=1; AFNElJ/r9JFWooelogVTj0tHFXO71zIZmJv3+nMOUmcAUpdANnpID/C46zYl3lnMeioLuCPgma4eIPxXTdP3e6xg@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6mYePXo8mzAHtmSkBlW+0QdMhrGSiINNw2jxo5O8FmMx8/tS
	qPvgaE4X3rfj/nkTFTmEbBLfDcwcLf2+0uluS/HGOYG5yHH6q4+96O940pXUVIJjnVfFBbmdQHX
	M0QCh1bOIy8ZArBjWZARvxtxEkFMrlYhLRrFhoj237AuwVLEWFl+XB6eUG1pbgrCPrq9t
X-Gm-Gg: Acq92OEO0ZtgUNe8CbeRcaWheQrwYY0OswEznLc2Sy6ontDEyJ51OqVLageWbV9hklX
	RaQelST5Q41aT4uUsCymogAjJaVhapzlSFgv0k6owtTbDpRxAmqAQWYz2kEaSBb4r+Mukdlxicg
	o7Zx6RbwAIglG+89vxAPUSbAYx2KE8HxvSTs8Svd9455sDuwc4vTkeYDxGC0+qn8kYnER8P2g/W
	3M7CxMue7OCeSGefrCobAvJ0lVfwBcPwqpAhp80DCVKJrMoNJz8ogrd9UV20Kcr6gf1b3Gtvwn2
	76rpK9bV/5iNJOzfparkXGhaQqThL+YlhYPQaP6qYWbblIv9+bp37h00v2tapciT0zJAQst9hnz
	4uyqCxdecC9knQ1093JUgUv8MN/YckVTyGFNE2iIxewNj6VwzDWuAfk8MPdL7kVr5jq7q76s/Vg
	9eyIPuv8IQYDckGyKMdYCKQQ2tFim8/01hliFsoBpXnM7I1Q==
X-Received: by 2002:a05:622a:5888:b0:516:dd5f:ed2c with SMTP id d75a77b69052e-5173a628dadmr144080291cf.22.1780307440338;
        Mon, 01 Jun 2026 02:50:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5888:b0:516:dd5f:ed2c with SMTP id d75a77b69052e-5173a628dadmr144080111cf.22.1780307439848;
        Mon, 01 Jun 2026 02:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3966a2b0c00sm16706001fa.12.2026.06.01.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:50:38 -0700 (PDT)
Date: Mon, 1 Jun 2026 12:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, rahul.samana@oss.qualcomm.com,
        harshitha.reddy@oss.qualcomm.com, dishank.garg@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Bluetooth: qca: combine NVM and calibration data for
 QCC2072
Message-ID: <ungiyrkfjmykhm65ttfchad7oxgx3d5mf6frj2xnq7mdudq6tw@hqwq5ms3553w>
References: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529180431.3373856-1-yepuri.siddu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CEmQXMpSlMq4hw0sNAT8VmcA77_1fNir
X-Proofpoint-GUID: CEmQXMpSlMq4hw0sNAT8VmcA77_1fNir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX1rnmO9OTivvR
 DiBN5WOAO6QXpEM6qQGpxr+bwG4PNgjeo/b2Pw8CHmoFGX3XGhr79FnJaNO2FNJdXkP1ZLn5I0u
 0sm8ROJd5cSD+aqYdlehankWheJ5OHxp1Z8Ie4wfiT43hRr0kVeNjTgW2U0S91erRFZCsSpTYa+
 28KjywCnYEHMu6UmDZ+I/my99ZkA3V67VOpcULx0SLgTtrwWalXdD7JVUa6eJP0/2jaQXNmIbbJ
 MaDScEK9v2KrqRMqzVFmfeRLH5WyAM8mdGGmP3GUDJ+DTI63X7+CZ2dZzrKZx0bFLOiVVO66lIy
 ICYz+V4qltFm9zpp1YU2l8AhSIFj+wzCr7b83ccK24xu0OHDRHnHaJpZYlZo1wqKuj3DESN4LPX
 vh1GSkKSE5W32QEJSmoM9fCsuRVocnIvbGZ9i954oFolXuENiabuBTvFurk8fa+46SxeqMAUVbl
 qn7qtvElZznq6c5sJqw==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d55f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=a5bjN7CP83JjU-aXAVEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110557-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80CAC61D0E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 11:34:31PM +0530, Yepuri Siddu wrote:
> QCC2072 requires the NVM and calibration data to be delivered to the
> controller bundled together in an outer TLV of type 4. After loading
> the NVM file, load the calibration file (qca/ornbcscal<ver>.bin) and
> combine both into a single buffer with the outer TLV header before
> passing it to qca_tlv_check_data().
> 
> The outer TLV header encodes the combined payload length in the high
> 24 bits and type 4 in the low 8 bits of the type_len field.
> 
> If the calibration file is unavailable, fall back to downloading the
> NVM alone.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 47 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)

This is only patch 4/4. For the future submissions please make sure that
you submit the whole set of patches as a single thread. Or, if it was
really supposed to be a single patch, make sure that you generate your
patches correctly. The general suggestion now is to use the b4 tool to
maintain your patches as it significantly automates and simplifies the
workflow.


-- 
With best wishes
Dmitry

