Return-Path: <linux-arm-msm+bounces-112276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id amFPMo2VKGogGgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:37:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC66649CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:37:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R4w17Bkm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OcsBswTt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284643039CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 22:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9813C8C71;
	Tue,  9 Jun 2026 22:26:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EFD331EC6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 22:26:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043997; cv=none; b=e/4D8yu72EBtNt0Jw2vM24KdiJTQ9rGwsUplx4adXK+CF5sq9x0TADG+5SHa59G+8Fz7gI1owCBxYdQ9G7vqCv7xkOR0TXHbtQmwgte3qe1jP+Q0ccHXtyYbkfftMSKam/9w6YVWhPdsjzLMcEFQyEMZBuJfmP1Ro2F1zUGg32c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043997; c=relaxed/simple;
	bh=wSmbSWrh4KvndShnDN5RVVAgjW/hDF2yEiEk/WtBayM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkC+9WRLaL4wAC3zBLn6V0D8aw8PN6cArWsU8+nHW4an7p5kuOY29ZeGAsu1lek68S4Ub3lwI6EMDmH1394k+Hp/DAXcXqnqkJ+c+WpjkBovzg6uvV9GTaG2FhiOF44UDyPyDhLsR5ugFVtC6lWI6RiZsYdXykMJwBEs6nubDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4w17Bkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcsBswTt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MEsqm3504262
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 22:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ts2sevuY/m2ocPH0TCVwzt2i
	P8IL8X/SqRKJ5vz6HlU=; b=R4w17Bkmge5qDosiuQAK+xx/ZLtvJfXFo9EZbqQu
	HOlsa/dPENsSfV5XLXzL6FDo84JTTyoxyTO6pcG3akeZFkXiSmdizbAbNgZVo1P8
	CVOWSpftquonnW879bQKb0rJDKcmqXGuwlaeJlKZQ5RbDqlnHq23kyIveT0MWb0g
	sY5NLb+i2O6qzwnAezhlTO+BOVAEIo4W4tqS5HVkBGObfRsFFCINIkAeXKVSEUv1
	q5nE8Iiq1BHTnmn+LBhalhGycpgWgi1RHR0gM670J8Sql9tdsSmubsA+ruhOB7OK
	Vn0XJ7hBIjRDy/sGGW07JuCHPZiFBKuM0GQXUH2mwY+iGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wkmb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517dadd84f8so963651cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781043994; x=1781648794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=OcsBswTtvHO0RvtT8mFWT5bOwmlsEuQ11sCckLngj/UDU694E+9M9N+YCxGwWpUrOW
         783TyedAU1iaxwZYsMTB63u7vZfkJ8wqk+jmqWmQ8uMqKhFOEU5wmpLaDcf0C+uzKxUT
         2z2Mw6yTu2Yqhvriu6WtWY3JRwsfLy+IuzuV6qyTmTyRTOWosHIW02WeR3nEcYrn6wEm
         M6Sy/YQPtU39+tF1a0PPM+K2evwsw9A4i6rnysnzmkIPWxi616T6jrJByYjGX+S0e9mU
         k+NmMSSWWIsqeAWOF3yohAeHHkzDZWNBJGy3tfEaigcvgOWNVriBSDzXL3ui9kb7d5/T
         LpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043994; x=1781648794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts2sevuY/m2ocPH0TCVwzt2iP8IL8X/SqRKJ5vz6HlU=;
        b=Pg9Q4W6OCi4Ijt66Be4KzRTO3Wb+/tDHV7TCIu/NFsmGUHwCmhnIYzbVxxUI5aQlqI
         xWGy/L2gU6Vyy9YqR+Y4vi9ibF4Am0SYz8E64/36B9Aws3P4yoHwfoADUJFLoZrKwQr7
         x4s1dYwq40spapSC5UDj9cBVmEQAyi+uQ8UKRF306uvSCHXTQ27yQ+ZlQmE3gWwpBWv8
         sLEyaiPhEFwyBNtOp94K9HK0sKQCpFyHuBTFUVQfwppR1Pvs7tPZxXrUW05EQ8pLvst0
         D8sqeEuuO6BWONxthQ1knKCY1qeTuW24tyFpa4xXed9B3MPUS3QPbSwqbTnODXLVY9OU
         AsDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OaZJGdnqGJI2kSqORJpyKjAqsBwmszCwf8Ln0FDAA6znX2D9PvpMAVJBallrklXVd03xD0uQCIWMreW2+@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1UXGHUQUDQ0R1fFmuikgRLHaAU2nlMXDK6RmlTXzeyq14/bp
	jp/9D+qSZ9CQqo/Jz/kNYA2aSiFOqWFah6A7AsFtHgGKOgDr0UZ0UyjkWOjPIox3QITIANDugLr
	jLmr6FgQcvVVXO85w48Vzd+bD5JYGciYqMKdsLrnS8WmYgochyoztoswojgYhuLJIHfOt
X-Gm-Gg: Acq92OGp2EtnzMLtobktKOMA9sIEet7OIm3cLOnjXK6fBmQYLX3Ha2CexnGHIsix0KX
	cz6eg7D0DbJRZyF+waNNv9TXMjhLQvtajOlyURwDKE+XvTCzlwJnaVa50VkFaNRgJi/MGywKUiQ
	NDEElXwOgHo2svBYedI5cpldFNcSGnRsrhg2zXSgmbfOZHALxx27Dv4p4qefYrc/AwaVygI9Rh6
	09D4ZlNEpknFMyFi8jggQkYpV12gs3uanT/B37jKAbTB7BPMxwEgpnvOXkufnciUxT37sIEFj3N
	VmCn7ZhaTEu6aaO3Ybj2QQuBqDCAydxGbMYycMI27+v1OeSjZ39oUm9byNTHX6maw6zjCAsJA6b
	TwQuoxBRMGIeo8iSViv155zm8OBFIYXKj9qXnPLGYASYfplwLnAEzAGHSq5AeGTyxCLLhDBWPK6
	NX3k9BUf2HgeCqDNpzUWdL2XU1AMd7DNpeAy9fwvJu6Z+U2Q==
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865371cf.46.1781043994101;
        Tue, 09 Jun 2026 15:26:34 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:516:e00e:6868 with SMTP id d75a77b69052e-517ca5fbb44mr62865141cf.46.1781043993726;
        Tue, 09 Jun 2026 15:26:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b906a83sm4906345e87.33.2026.06.09.15.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:26:32 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:26:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Message-ID: <fg4oncrltunkvfgdca2ol6sx4tduvewuk3y6zw4bscgr42cmqu@noojvhygjwhq>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-3-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMSBTYWx0ZWRfX6JulR8A5/qI/
 9sfHuy4FrSejFjvIcubJ6cCY04C7Drfy8r03QWtiJ7xgItLOsbCN4VxQM69CrP/snLo4TJV31zo
 KBHD57vHPOLY9kksPnz16Uya7b66a7IKyy+p/N1FPR0QRhc78/MB8guJIvoB5nR/IJ/cr35v/VG
 Cm+F0ysDvmPKkZTCyzDVjPdisbqgcdVEXH/BYzB4gzuVyNlgmcmx0D7StV/1nKIuTQw3vcSwYNU
 VvCMPWPe46EkPr77riysH71zI/kBQgXhRzZJg+jl9PeTGZlNeRZ7R6qYRHKZ5gcmSleNcMRe3Pi
 4EydfjzwfoMNpkESmDV+qLjXM+s5nJYcP6Nw5nW1T2VGlYeMjSHs9QE+UncUQiwsUscYnuxgxhA
 xHvBm14MAapkZZ/ZgSE0Pi2hvUEo9eSAc0u45f/sICzzcebsfmHrbmsI/BFWQr5Ps4QZ3uuzWc/
 AOhpKLO6tVbC2bABk9g==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a28931b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JNbnNDg-RtrLR9FoxugA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Kv4_yvJT6xtP_q_10YF09Khng9J_g8_D
X-Proofpoint-ORIG-GUID: Kv4_yvJT6xtP_q_10YF09Khng9J_g8_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090211
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112276-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,noojvhygjwhq:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AEC66649CE

On Tue, Jun 09, 2026 at 09:45:42PM +0530, Vikash Garodia wrote:
> Enable video en/decoder on the Shikra EVK board.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

