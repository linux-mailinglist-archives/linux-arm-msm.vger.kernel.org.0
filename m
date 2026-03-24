Return-Path: <linux-arm-msm+bounces-99731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPDZJjD7wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:59:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E231C9BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71AC5304CCD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089021A38F9;
	Tue, 24 Mar 2026 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAJTtUAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTQFIWMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0189359A9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385606; cv=none; b=kiHb0pZ5xzpMwvnIbrVGZDhgXiz6xGgpgJv/Wj0vjYWzRIsjKMYO34f/MtLw8WPUAu06FqzmLVI0Z8aaXv4l7Lu15H20FNcZ2EOWMf5NpDUtvhWjb0x90dZTRtbtGgTq/TXU2Weh/yEua/BRaMYtoVeEXaQO3R26heG/U1sFUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385606; c=relaxed/simple;
	bh=NSQDaIc6B+6AKH4NtV4sGz6xY8nqprSwpjDJbl38Ofk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJMEzIJu/0+MMh5ZjWpXeT4L1hX6l8wMQ6eemNIRlTg+wN68BcaGqU/3OPLVmD1HQl2lWQgJkqlcmm8EJ0DyTiSt3bB/KZ1WKf/L+wz0drj9WhfqumTowtqpgpuo69kyRYxjw7PzpbxelpEgOKxhMKTU5Qef+wq/oAuSuFFA3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAJTtUAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTQFIWMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD8M73731518
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUcSB1EO0xjAITGH0sHDE53x
	GeXK6K+ju8W0/0xClh8=; b=FAJTtUARZXImI/LjWYXkv0MjSrpJcge+EfNpV98q
	ecHUwOwKTKOJXfoJxj6Vq51JTsyK7wfEj03yZ3rpYWz3OQwFOzjdEN8xiBM5brrh
	bHIP4dH643W0AFpfbYfn8iaMVLhsHYMvaYLGMI4cTqUc6FieYhykF2g/d5/uoFHD
	IaRPYaNTQnxVAafeApodGq4bI+QZ1QM2Ya5LDn/B1ahH2qfg7wJuNQcsqc2ov8GD
	Ya0yu4/mBS2EwN32TryKQahLZ91Qqp9ULB5+xbAawN1/SgAFbYHxFgtBUleYwYQz
	BqKvjiU3YQ5oLVJhs9GJm30RjAe0v1n4ODjvSS95v1riTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkets2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:53:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso120852861cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385604; x=1774990404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUcSB1EO0xjAITGH0sHDE53xGeXK6K+ju8W0/0xClh8=;
        b=LTQFIWMOw2kFGKuSEerya2ErjKd0B6VisgTq2vTE2U+UKoz8XegQ+FOeFPNzee4Q+A
         KCfVQuSfJYJIzsEUvGxGkbWUES84KyBcfXuTVjyH8xKUm2ANXS+3yKsZEgJahyR6tixF
         s1UAzgq4VNFkgKMcLGuJ6C1g7oDgxi+vn2ybV5cjhGf6NnGj3Ij0LEV9RdfYB/vmCIql
         SjK3+40NUR5qgpP+KHAhYAmWYQ7DGQzlL6cTzXHE3W+xQdy3vrWrQqQrXUlQeRU82P2E
         n62nfOfcfE9JbM0iLEqEE8Lom7+pp/bvMLD4liz7dzwXxUamEG1G0fmmYFrtR1Ea2Csf
         F6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385604; x=1774990404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUcSB1EO0xjAITGH0sHDE53xGeXK6K+ju8W0/0xClh8=;
        b=PQk//tGvW25T44Gfv9lkUCCr655cZVg31hvJD+z8+5j6YImXLzXDfxgSNORTQsyFuZ
         VzYFg6FEFxmWehRN4T/rYfGarhgNt8VZayXpL4AANB7Jqruf2rrG6xq9JunFdDCaiCBs
         8J4igc9ImoQbsGUoQ5wDPXU1sGCx8ml68oEtK0Fq64OwKyrgVI9+0oWKshhW8FdCIlgC
         od+p6nlJhiF+ylNMUcat357oJCgGhQFvE3TgSDcqCk9QhsjLyrUChyiLTZ0huvTzwkvl
         xOlnEpB5LRnBl3YwQBaL1ERfWJl1dfIn8BF6jEWmzS3M4IgRqX+MYifk+MDTkexQUZ5s
         k2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVi5vwp7a4PxbDM3eWLJgvszvk+ToPjG78jKcJqlqCMHKfhf/6ndZd9Mt/TyINAk96g0dO41TT29q0rNUt6@vger.kernel.org
X-Gm-Message-State: AOJu0YxheoSk6w59oFA6e9ND5zViZazo6OZbLl/ZYn7tUTjoUAjqbjNv
	JsFRvkL8s+HZ+DYyZr/7Km6gZvrMkYvhSAAz3NFIyymhoHFgYQU2Hh5e6PjHkxmsueVNkzLPqrE
	2xNn1yJ27LtzEhuN+wjhau2cw8YJZvG+gDt+nxlsn7+RB17760y8CirkO+CvSk5B39tLE
X-Gm-Gg: ATEYQzxwfWihU9hvQgrmF29T6u1wDK4074KqTWFrgyRrjv1O7NyutkJwDKyjMw/HHcd
	GoxiN9a3pH/U5vfkFko6UIGW96lCHOet2h3D66T3PNCBFCH11gUj0IdSxiRfBV79N8D5H8vTwF8
	wm/564C7ia+6r0PUJb/uDsQ2yYopRD5olFRCb6IPlmxIiQFS1QiPsL04VKQvCxWwxrSU5oCf6G8
	gN8yaObpubTXkv19Q7YRObdrfnpCH1xm2eUeUWqptsOuH0DHvrlNnD5c6D+1VRAWbeyZFhBfOyv
	tL9L5Z5VGpiXvuBWNL/ynwWMbnzn1mdsLTptn4AGzotXRQ0NLKgU6c9gt0BIJpg8LSquFDbUQp1
	rB3FbyVtwpKPyPbk/Oq2jvzPNQb3S8c97L7D+xsud4ecCPbuF4QCX6skF7ZGAoOWX+jliucMdgv
	gJVsMKcWmgBgsHHAhpHZMalZn74UVOUu4Kzp0=
X-Received: by 2002:a05:622a:8310:b0:50b:5258:28df with SMTP id d75a77b69052e-50b80cd1eeemr15392421cf.1.1774385604098;
        Tue, 24 Mar 2026 13:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:8310:b0:50b:5258:28df with SMTP id d75a77b69052e-50b80cd1eeemr15392131cf.1.1774385603624;
        Tue, 24 Mar 2026 13:53:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530ccf9sm3368152e87.74.2026.03.24.13.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:53:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:53:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] arm64: dts: qcom: qcs615-ride: enable QSPI and
 NOR flash
Message-ID: <zwfbabbr4bwlq4bnc7hwy5gbfrs7j52mloukkmyytxwqgl667z@eoq75ye27yul>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-4-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-4-3efe59c1c119@oss.qualcomm.com>
X-Proofpoint-GUID: GHbPtM5Wv2dBbrYdKBPolyqNP-dXufyU
X-Proofpoint-ORIG-GUID: GHbPtM5Wv2dBbrYdKBPolyqNP-dXufyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX4//tilTE02Q4
 X3i2CLQeK5ZpY1XnW/hda65805gpJcZlcjgxpOf5l4qgAx41rCSsgNbtiqxE4coH4zVTHHvrlaz
 buOKftS4NH4f6+heCW3/mczRD5pxEEVZ3K7LsRXBXWeuL4NENwkjps3fVH2PeTvLovQrqYYhUiG
 k+WR0bbfhDkZt73MUtb7QK+8cizpfmifpbY+RmStWLcoE1IsvPTP4U9j6KwuM0yK78PCfvUracK
 BpnGNxNcX2f32J7yYtPsVUrrocl6H8HkkgpX2mDOQr/HnZiSTd285HjRw/OMQAALaNrrFNxsOpv
 tipaKxjTJ05Oo5pNGnXxZ1o9S2/BmKf+hGnKR7gDaVX3D0VjdfiFGOwSIndcMr5amztd57X7vco
 vAh1VQLmh3WFAFt7f0LHVY83I/4H1WOXBC5ilgaGAuoslLAKIX1Jfm2mm0x0pI/2htbZyG1ZCNI
 DkcreDrCC2r0ONGD6Uw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2f9c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Nlfn2TMoNVKOkoW8Ct4A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99731-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 189E231C9BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:43:21PM +0530, Viken Dadhaniya wrote:
> The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
> on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
> node to allow the system to access it.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

