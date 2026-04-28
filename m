Return-Path: <linux-arm-msm+bounces-105066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCrtHLwC8WnubgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6B648AE60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264C9306B408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF8E1DB551;
	Tue, 28 Apr 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or8t01Tz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjDiTBAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C5477E28
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402515; cv=pass; b=BpxXLG0sLGkK619rIR/3gV5xC03hHAJm9WRUpYrAlKCapkq5deGr/HouKBefaGYoQryfzVD2uudNlOw2YB6Uz0S68mkfgmnl2yHoOhkrhIO4CpOazUJtuiFilTmoQw54FKjGVpfg2wyKE4setFEB8IuFChmyE1Mj9uYJz5vrbdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402515; c=relaxed/simple;
	bh=48YB3Ndqy1orkOBGaDNajZ3kV1mp4TNcdrH+V5/Taa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWmurJ5G82cvwggNPefvaJBzWYceBNhvZ2aFZRJ7BhXFbshoyCLXvjR92RpOC6A1gtGTVg68Yedhk25rDQFZ2OPC/BqQl8OvCyKiTYpk2qS5s+39UK41i8CNVcwHxtut2SlLtVK2j6yZt4nPMkZmLv0cUfvtOIi0qNrckKSa2+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or8t01Tz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjDiTBAP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SH0dVG831217
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=442/8iOej5uMFBsrBy8C8V1f
	bre1zWZUcI0+Mu9/ZKE=; b=or8t01Tz4Y1qEm952d/nrUpv8nh2kDFsOPGBOH74
	WfVes2r44YAE84N4PaJ4tcozPzqROiqVg2M11dEEwahBvY6am9IpItoHf/4RTweH
	+por1ztFf97oGh9ef7rhH+6szEiGS+OTLab3yKfwI2AxYkA8JeN/POlHaXcoqsoK
	ASoqQUjw73dh7hj8nInq9uhLDWVJ5X0zAg9kwANaoA6kyN67DZc8ECC2SBzpaMMv
	5SCA+c2nkmepwnAV0FV8IynSkD2ZZ+taeUPnrKnHTzlJI/KgM0yOezh4pYYiUrcw
	b49rgL5rw664VtPF2X6lX4voeYrGff9tMp2JZ+a6EjAFgg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wq8de7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:55:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so15623385b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402512; cv=none;
        d=google.com; s=arc-20240605;
        b=Yb1ERQe75K8ecoEAEVsw1o1Qr2bvQ9MBIKULiXXo3+aLqTV6QcKiJjBGc86OXNOrpS
         dCdEFD1pD14zsPMyErAgKOqS7yJHqAoj5l8KcxlRDGmrYF7lergD2YrpySc2pCHmPJMI
         muVwvXwquWe/ayhcD2LILIhKI4/SxsMj0Rj2qWs+lZU5B9n0rwZ3x7g1WIAA0lpbkyOQ
         rwpfvSYG9GM+qGt14WE14m7gZUegKz/kJhP+edQmUwAjMgOdH9grg1uOhT4pSLxcJN6u
         7DoIh94wJ8GzjmR0giDXrYzjLgMMBgfJdcvyvAkTgeGyGndbzV0Z88vdjY3OAQS0NfDh
         hgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        fh=4o6/z/7jcIzf7xIXo9hRPV6Z876r9xpQovK5gUDTT94=;
        b=X3VSQZz/hFRjgEGCZXvFFk5ulI6d9R1BWeQpne2430JcAaNpEmFH4rEdarbtp9Lloe
         Exc9DzC2EpTplcOtihJjnFPSQmW6ulqMSD1wDX0ed8N/AnP7QpYGyNkCqXnb5APz2lTO
         kYc72zlLYj+KZUY2D7jz9Vv3/RwTJks+a9vbXffePWs88TLfw17oDWxDKBe5VjQx8a67
         1jEr4bF3MG4C/g8BYOYPSZtiqbx1rT2JQHO6Ox9x/EvzfGns82KFz1c7SRDMpDHCEW9X
         PeRXLb+8hErX7jl84pWkbvx0GyhDS7S1Fzsk0YadzIIWnBajuYe/EUrRMOZDtpmdKfz2
         RoSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402512; x=1778007312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=kjDiTBAPpTpQfr8TvSyZy7jjcbwhWdx362hfAblCd0WaA8MQ8jd5roHCDkGxLef6Xf
         w7it05j5t9s2CuJvWSXajPXD3l1iQhTlo8YvXu6MQYwwVmFYVyLxMC1A8fpy2/qsTLgJ
         Bk0238zf+x7tHXRbjK9rUaYYLzYfvuATKRmP6y7pQeB2Mq74kbKTfaAyxb+0fRZnhauO
         gVb9kG3vecz3AlBAcGljF7+MftxaKmzab7dKD2yp2uP7zRuukGQqC7m7nnDkLSEcbIJa
         SoIETQTOjbMl3w0aPfUkFvwA6yz2TqzulIvs/1s5SVNC/iMahEnc02ZiVFpV1z/ilppw
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402512; x=1778007312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=UD3NpEhskkxzT1r8LmhJEjiKF7tqUCjsFaV9dH3UAaRfneKQV5ZcjMPQsvYUjhac6q
         YSkkzXNkjoM+ll+6+E08Rapz3sAwhV/OW7Kq3jWQoxMD8NqXiIOgNAOum00taBjW0mks
         53u/xbSLMqK7WtGO4Tptv4an1sSMa4G9C2J4aFDvx+UyFTcMrQ7etNS/D62jRXUG5p8G
         JzQYoN/JzLvYM5mZ4xt0WP6DttB/2XuWq2hFIvaQhD+So2k6DNKBw8FAXE+JNkENsy1J
         0rat4Xd8O09htOYm0DG5Cwi5kO3inpaJjEWduvghQpY8gKUIzW+78XCTIKWxM3O2RpRG
         0gBA==
X-Forwarded-Encrypted: i=1; AFNElJ/fkpc0ZFTemqLqd5zQXxEonUWuc+1KU82v6WJTl1mZjqKlNstTtwIF/tJjNAYnln6IZCdcgTsv4HfBJlR9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3pvHBa4qV+KHdVtqAEQoG27S7rtTiUTXNZZcRblsbISBDq1s
	qkuZy8wtftAYh7havRcPl0GLp1MpuZXzCyjS9d10xL5eW8qQQ/ug+10YXHPO0qG/alsvfAtQwDp
	jL1sfLm7QHW682uZP0m5R7bBekzQQKBR1uXsCFNR2Zb74Cq1IsapMADWKeJFnN9WAG4e/WcUTJr
	Be8YayJ10m0Zi7BTih6wXtYthuhqYC/LXcNeDTlqoXEgo=
X-Gm-Gg: AeBDievPLSVpLZQKAhsx7gGzPL0jS2qoCTpC+NAuUSaiww4bryjfscAlSH5Atma+4an
	2uMlR/uV0V1Avkn+fnxndIqGsYYbmrinNlZFAJ5Dyf8wEUurRSAYWqXfq47pwqFlpLyr8FIelT7
	jRcIhHi+qroaWs2O3ieBCXp0WAUuqKa5g3cO/lYF/vn5P0KbVkr20z5a8RZp2UX0sgAHM5udvD5
	OW86Ajb1ptsZ4Q9LSR8ArwIhSJosS5H7GjAdfhRA26U2fme
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-834ea57fb2cmr557838b3a.1.1777402511967;
        Tue, 28 Apr 2026 11:55:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id
 d2e1a72fcca58-834ea57fb2cmr557786b3a.1.1777402511417; Tue, 28 Apr 2026
 11:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
 <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky> <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
In-Reply-To: <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:54:59 +0300
X-Gm-Features: AVHnY4IiC0s9loCkcUtYnjwZYf6U05xc0VvVRDkF4BRux375tv-oGwdPaCptzn4
Message-ID: <CAO9ioeXQHDYRPW6HYQ7XXsmf1ovpJyqaXgnGaDVnACb3PW7oOA@mail.gmail.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 9jqp0NcoBpil5485n3GuWDJFjjlsm7BP
X-Proofpoint-ORIG-GUID: 9jqp0NcoBpil5485n3GuWDJFjjlsm7BP
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f10290 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=4jyo0phO276cF_ToP1MA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4MyBTYWx0ZWRfX+VW2CdBlKCCE
 JvBeS9lmCWwC1FUn50xmsJNolTr+k6Fmjo8JLdmVVCdZKXuNgv1hsFPpwRz6qtnXP3GFMuISiDS
 ZWN+nsh1WbNsmij54+W7fdmfMtS603xDBdy5ReCsimlsngzOFiE5M9fxcqauxmXNoyjZmknbjl9
 w7o3pud8y0ll381MIe5kH2CE9RUQzOQB35snSgj8Fi4iWkxKex3CAyj1IOPXGIjWx2r/HnNcIS6
 DxUP5wDaAqnQ0dGTRn9xFg9UyZTTUdDw+HZBgG9fUl/a4fVgfkOpOqW3cqu0mW94t9UwNpMfHuC
 ci2oclCKBvXUhS/08ZnKEek6uA6DjSdbI6B954uMAhdZlNaaxRpmyaeIdsHDDQnpk/4os3CUaVe
 9FnJip265FEhNzXAtQo52SshzuiRnU9SkGszhjxl9OlfOPA216NhvyDk6lDIK731LURXUnSjsUf
 VLTa138vp5zH8zruBNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280183
X-Rspamd-Queue-Id: CD6B648AE60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105066-lists,linux-arm-msm=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]

On Tue, 28 Apr 2026 at 20:22, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/23/2026 12:03 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
> >> Add support to control the DISPCC MDSS MDP RCG and the associated display
> >> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> >> enabled, the clock ops of these clocks will be updated by the common code
> >> before registration to use CRM specific clock ops, allowing these clocks
> >> to be controlled using display CRM (CESTA Resource Manager) hardware.
> >>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
> >>  1 file changed, 56 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> >> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
> >> --- a/drivers/clk/qcom/dispcc-sm8750.c
> >> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> >> @@ -71,6 +71,16 @@ enum {
> >>      P_SLEEP_CLK,
> >>  };
> >>
> >> +static struct clk_crm disp_crm = {
> >> +    .max_perf_ol = 10,
> >> +    .regs = {
> >> +            .reg_cfg_rcgr_lut_base = 0xd8,
> >> +            .reg_l_val_lut_base = 0xdc,
> >> +            .vcd_offset = 0x268,
> >> +            .lut_level_offset = 0x28,
> >
> > Seeing this configuration makes me even more sure. There is no separate
> > CRM or disp-crm. The CRM resources should be consumed by dispcc.
> >
>
> The CRM can be used by interconnect drivers also for BW voting via CESTA.
> Hence it cannot be consumed by dispcc alone.

At least mention it in the commit message, please. How is it going to
be used by interconnect? Will it use the same API?

>
> >> +    },
> >> +};
> >> +
> >>  static const struct pll_vco pongo_elu_vco[] = {
> >>      { 38400000, 38400000, 0 },
> >>  };
> >> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
> >>      .user_ctl_hi_val = 0x00000002,
> >>  };
> >>
> >> +static struct clk_init_data disp_cc_pll0_init = {
> >> +    .name = "disp_cc_pll0",
> >> +    .parent_data = &(const struct clk_parent_data) {
> >> +            .index = DT_BI_TCXO,
> >> +    },
> >> +    .num_parents = 1,
> >> +    .flags = CLK_GET_RATE_NOCACHE,
> >
> > Why? It wasn't there beforehand.
> >
>
> The PLL rate can be changed by CESTA outside of the PLL callbacks, when a perf level request
> is sent via CRM API in RCG's prepare()/set_rate() callbacks. Having this flag ensures that the
> PLL rate is recalculated from hardware every time when users query the PLL's clk_rate node,
> providing the correct PLL rate configured by CESTA.

=> commit message.

-- 
With best wishes
Dmitry

