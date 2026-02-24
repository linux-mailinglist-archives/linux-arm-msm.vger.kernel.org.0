Return-Path: <linux-arm-msm+bounces-93908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJP1EoFInWk7OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:43:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF9182830
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54E70303D38C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75176304BA3;
	Tue, 24 Feb 2026 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQoOmS3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDJiJtJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF023043B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915372; cv=none; b=fBkSp0cSibvUWi944UiM326ySlIJ4L65sffb8erNNX8u5Uhq/dLPvOmN9rd4kFF2PLeUQJxauuQM3uVr/Pnh8E25r018ZHQNdXseYWLfVUzI06rMjmK3TmI8AE1r7NsAE82IcrZeZI5AJog4CQ6rvBW22IOn36NT4n6VeRGsMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915372; c=relaxed/simple;
	bh=eMWrTv7PVwm3+cluS/LHI4HkECYdMPIWjf1iKDIuMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lh9yIhtQEIeSPzNZKtAJj5svJye34cu1uNjq+icxjcWuCroD2SAxbiF1CA3Kb8/nWj2rWSD8KB7/dzOyKNGFl5UBQ6BxQSW5asQsPeoXe5ivEd//cj9mQ0o9Ndfem2j5aqf5SgpMVdlwUW7Tx1ne1z6BDmgO3Vg4x2QawLw2wGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQoOmS3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDJiJtJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LdKp1807980
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cJ3GaypcC9G4k9TdsHdr+XBC
	k7oILCyCS/oWUhCgxLQ=; b=ZQoOmS3niQ7Gaq9Kh/qkSdITOrkaccTsFWv+5yn9
	vJ+sBGymXpBP7GPzFC/uvjX0TZYCTX/TPHztcOwW0o4khukxeEMRMIVlt5fHpEvB
	ALryPc0zHkISLfQNCt1yIsfmtvMLn5DzbXeikSh9PQAB/U29LdCpDCxcIFl0vxh6
	v91mSFSomMvEjOQfUk3K+C0CE/BfOupQ3OQZTFIq2Sk+1/EJVER15LQhI16VXlYC
	HnwRu0D/uu9ity/DlExttW33UR+vJkphaZTLp4IiPGsLVOpiiolYu+lS1wrfWfbY
	a9G7lPDhdLuTUi9p6H/peAywqYQjO7yP7JWQYAPlzzBmkQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38dhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:42:50 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a075e177so21626186b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771915369; x=1772520169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ3GaypcC9G4k9TdsHdr+XBCk7oILCyCS/oWUhCgxLQ=;
        b=NDJiJtJSPvSm/C/5mSS2HPosvfFYsOhhfGqsmw53aUgZGf7OGJan4yWQVqZiPvw3WP
         C4ijcALOQZQEfiJ/LIw5mNCy0EHtd7SvETcmq8EcGgt90XimgM2HtYzKiV8DcwxEUeiC
         yqx/wyWq1ADXkTfa5jm5XFelWoIGwO8qEUXmHvoZMktAhsmQl77t4hxa5/oTXowAcAiP
         MtYmy9Uu2nHlpHzMi/7mSgpFxETkVkQDPlLXH6doN88NG82k16YqOMT+Q/QUkkicI782
         ZlefI4Y+4Qvq3I+p6EjVEUi3tbnQCQM9c/Boq3rcKPbtlgguxVtVV7KupdrteV+fWRDJ
         ihkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915369; x=1772520169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJ3GaypcC9G4k9TdsHdr+XBCk7oILCyCS/oWUhCgxLQ=;
        b=eSL3fVJNDz+6Vc+uOVk0YcJ0mSBvWUu+eEF6vZORqaKPpR13Nen/MeqQq5TyNOxF4b
         uNeSevtATiEQ0Q/pGHAovN0lqKMeDnl/qZJLgD0z/09qbMWxCPi3XkwhuRXdKdyavBdK
         QpNEm2d97AekqrLJG5W/ynh5JD56LibuSYI75lVmrtsxGVGIV24oqybyX/nLKFvNqSb+
         HyS8SeuTcHD7rsCggrlXduRaLCL6lDJmcgJH4I/+7fL8jh3qLJ39eqGpWcWo38AT+2HY
         fbQV6mnSRGKQdGhMKtvPVth0W8jzWlzfNRBeAIvm3Zm5hSU4ad7GB0SYPxeyXxsQESjh
         /jnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+wGUD9r9zBWRwTtneuoaZvVqSakQRxMg5yDQ9BigpvNi4HoPIFbbVH3zAxONkHjPnaMdElWoGzwZe2Q4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Atyvv0uq07qKH4wI5ylex7ARHofS7pBBHGAOhU8pJroQpnZQ
	CfgUTS/LT41iLGGp+b51IvaYfziVMuSGsmKGThTp3sDOgPTRjuGqVvh3Gk7kSMaVQ2tzTJhZQOV
	9DszoJyIRgMEfx3Mp5qOrmSESjipzN4njuLB2CXGndPjfRsaoBRlUyUOiC5HoXAnV69+YDbjAeG
	GI0+Q=
X-Gm-Gg: AZuq6aKKhycHOoXnUicdSXkCnGGIXDRrHpLdGpCzmB7Lu9wwwAtFcASaWwBh5wp1366
	aMnoYLEOKH0fcch7zpzkTS4ju/JGOOtnbw6gKehqGqvcKBA/ENioP+t+o4THYyj+YbxhDrUQUE3
	055yU88zBz3Arg27G3orW6p2XFozTKBJCy3O+MUzS9QSlLJlKo7QyYcoHsujTZrrieT3Pqbf8yz
	OPtRTL8J/IXJrB03mrl6qD2jdoRdPPMk/Uu0x6WwVFLf1Qfvo96XYg/OIO7v5cc/Ar/cSd/wb4l
	WvpplUmqWKjMAV06EuAHeq4etloYJfkgO0aE1C6EEjZrpafscHwOMpSiWesFQJi32GTVh9lImLD
	LqbDyLBXVCJ0wCfG8/T5VmXSoBhIAqLsMN0jApQnFKIn/4aChHqmxzNooQ6t8TGdnm8Kl
X-Received: by 2002:a05:6808:1596:b0:45c:925b:5848 with SMTP id 5614622812f47-4644635b16amr6539142b6e.45.1771915369465;
        Mon, 23 Feb 2026 22:42:49 -0800 (PST)
X-Received: by 2002:a05:6808:1596:b0:45c:925b:5848 with SMTP id 5614622812f47-4644635b16amr6539131b6e.45.1771915369129;
        Mon, 23 Feb 2026 22:42:49 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1aef6csm6500238b6e.15.2026.02.23.22.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:42:48 -0800 (PST)
Date: Mon, 23 Feb 2026 22:42:46 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <aZ1IZsrzTLAvxg9o@hu-qianyu-lv.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-2-87ca84fd78b3@oss.qualcomm.com>
 <jvitdcolh4naqjdahaajlzdctcmp3sy5odiheeqacps6pcbg5t@zx3jliileazg>
 <aY1KCLDDoQtLJ4F1@hu-qianyu-lv.qualcomm.com>
 <hi2znbyo5tunwi6du5ifxjci4xmjvfz5wrbikqs7yagpt2rhki@il4g5olkhkvw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hi2znbyo5tunwi6du5ifxjci4xmjvfz5wrbikqs7yagpt2rhki@il4g5olkhkvw>
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d486a cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fBCqObQPdmQB8sgSFtYA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: g1s3NwNOaaoZuqzK1MUaQumIZMjumg5l
X-Proofpoint-ORIG-GUID: g1s3NwNOaaoZuqzK1MUaQumIZMjumg5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NiBTYWx0ZWRfX/vIY0edyeNVY
 jtAZLUmJphlXbFkn0p3nQIyJyFVufEALUSnUl5/+BWudSuvEx0JoqmxfrPGiHnVoMZYbX/HmDb9
 j9a8U85cis+kPTGVj8+oBq4GR+VJ2uRB4cjYD6PW/bG79gMsxZTabgZKUojZXRsMzsYSel+CocP
 lnQUtQ8Jbvs8Xl4yKa7UTphr3LAfnTVJ2G/eJMuCZdXXY0HI2sF5ksqCnZrTvEDblooK8JjS2X/
 flYAUdlAPJHKJ7s87hGZ6Wg0LJpoLaVax1td0TioNEBFT9dGUVkTgKVyQ0hVTZA1E/Wo/8WzZiV
 fpOIoXy8ruZW5FR/8YLy8FiQLpZfKCIvCWFjWoLc3xE9yRE61tXTeZeDHpXXNSIHMP+vKB/8pn3
 JnBtS91lnJfkInMFPtD6vXaFAyGoXCP5G3vd62EhBBZMhGpBso+iaHWy6ugwwpor673XQsA7aTs
 j3SS724TgRpGRflyUdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93908-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hu-qianyu-lv.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8FF9182830
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 07:48:23PM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 11, 2026 at 07:33:28PM -0800, Qiang Yu wrote:
> > On Mon, Feb 09, 2026 at 03:15:24PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Feb 08, 2026 at 08:49:40PM -0800, Qiang Yu wrote:
> > > > The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> > > > two power supplies independent from the PHY's core and qref rails. Add
> > > > support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> > > > glymur_qmp_phy_vreg_l list.
> > > > 
> > > > Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> > > 
> > > I'd ask for the DTSI patch too...
> > >
> > I will post dtsi patch after we get agreement on how to descibe refgen in
> > dt-bindings.
> 
> Please include DT patches in future series, they help us understand your
> changes.
>
Okay, will include DT patches in future series.

- Qiang Yu
> > 
> > - Qiang Yu
> > > > 
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

