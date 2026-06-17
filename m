Return-Path: <linux-arm-msm+bounces-113655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 141EAiKuMmo33gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:24:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A792E69A828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:24:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mJsiOQop;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KZz3fFzj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113655-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113655-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34E963098F17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ABE449ECA;
	Wed, 17 Jun 2026 14:24:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8293F58D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:24:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706262; cv=pass; b=SdO9oJkMIfJMQqNW6usc5GJnilg/ZVLzr9Bca74UiInoNUaFOHhViTCA50SEhdDebqBW242KfYvEgQoL0SaM7FnOq1dCQjIy+2tdOr3AfPposzIexvFKVGn/sZT0fu1hHHkLsEmjx4MBj8rPZPntJlCw9m/W9p4ihB+ObyqRMws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706262; c=relaxed/simple;
	bh=YUj1YaJZgp/6/Dz4ISRzrv6wVKDtSArxrSqys3oGzCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKbuD27a2A8UcekSsuMRebXusm5TGZ3nuw4j1YRCBxP6YHOd2sP+hHm0r7tQ/j94aR4IuISinJMIKVDBtWtm7MO/8WKsIBPnT/MYzctXvHyxx3OrrRh7n28Yoj6BApP/TdLqs2R/8Nt9KZEx3K9XtNKPlpJYNUN7pM8KrCFEo+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJsiOQop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZz3fFzj; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEbop2993581
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=; b=mJsiOQoplOPPiB74
	6SN7qOqFmkQQYJp6ZoMmx5CMWB4jLZxqaKVQtH0XQQS9BrzvOEI3REPHanhN8K77
	mKNckz0EnICqHU+I8J2X3JpbS5q6uC+frxS4aYfj6NV6oHWao3zieFaadTAOg3fK
	FespPZUPna/ZHODSn7xmROhhzCX4dfTh6t8mzmgGiBcA65NKjYi3a5EgPF1KAfVf
	PWSu6FtRBscPHUNJCMH3E/7iveZvrAeY6KzrYktblpVqvVshBZeFsy0lYR7A+Dj/
	SBr/D1Z+6zMyjbBe4YuRb+QC7iuyhWTxaxfYh+Nn/vwf43ev8dBExc5b5FuyWmfC
	JE033g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerbm9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-660555be5a0so5768120d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 07:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781706258; cv=none;
        d=google.com; s=arc-20240605;
        b=GxDbSFU+k/ouoUnbfvFyE37wITD5cf9tfjJcKBk5x8618YtUBNRzHRRqxbQ0h5D6uP
         Wv3RwBkBNFRjfKMS3ZlINdnmLI0x3746IJxuXVCBh79HFJohgK8lwFRCZkCDpDX6j5vG
         vSkbbej1BYief3bPHycz9SR4umMiB+OtzRhBXXdHDIkHBlVx8zDSpbabbEBD8tnQ54sq
         ZiCxj1DvKPJt/YnkfBOdnziecZLfIHKG5FKIw7/zEFbYytYJaU1gvBiPhAU/x3rQl5Nw
         rKuR0s9zm4bme14hzC2aZSsAmRharC8FkfsQyYlABbMCD6uZ3drW+cct1BnLtAfU6kG6
         sYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        fh=gfiNoppNoFjMClHjSc2WWusffF4iUxLkZ7cStgZ3RX4=;
        b=G9x+8QxvsnBlF2cyhodcNTokG/JiuWbWvObKnznfh42PPb3JJREdn8r0NocKn+nbVj
         N384iIApvfTIWZOFoq/3E7fv3Mbkk/8mSlTQaqKh0KzbQP7uiUTgJWXJjOXqz62mTOIx
         heQEHau9FGfpDnzjBxYNTiBnDxZdw44ZW7XJ0geOxCzdG8RJMa6UcydpcwGskpuKZe7q
         2/FxLPiGsXpP4N44pJyC8wW8waAmUkVh7P3XiJYFXb3fJEQLjKAG6khKoGKXFPCV0sOL
         BvUHbszcNl6EWxcpAP0HcFFDwvx8ZldyaDMVFobIXSQOnJg0RK2uoc5cNuqAV3J2oMWu
         KFww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781706258; x=1782311058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        b=KZz3fFzjCUsFmQMJsfks7WXthnQJGFTR1+GF8z8CknITp5mdNTVgYIMNyc2EqagIM+
         +edZH17Hp1mAM3iXxF9EVhvU7Iqrue96h2GjZdbKYgB99oHdIZRnIq7rrrVBblxNxXZD
         oOL12hTZGIGKCWZ4mLizY/pKOOwj+89rgx8s2VHUIwaOjLZHXNg1dDI7KKl+52cVJK89
         EdVC/TIwQNSZ11O7HqX+V96+5dOq8y4szz59NAheBiO5O1jBk3Ho0pfhg3GWc4Dw2tJn
         b+XiO3tQiuazNcJ5SThlqtC+hskicie7PjEla/d3aBzsr5B+5iV+VohD5a2XJ/zO0oTi
         EmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706258; x=1782311058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        b=XxHMUjJBeoTeZGEami3b31OEjTeaHvqr4K/IKaJzxSaLaxM+2zqh1LssdXGCZHclDB
         +ONur5XPgZgDRyq4Ezs2GfSHGGPhSkANry8fxC+j+U4I2nPXfqZ6JLTLjG4aJ8vxEgdp
         TpY1RN+Njrnsa2gd5f0jmZJSI3FpQHDvWZYrL6F8ZwJINODBpFWGAs+tN8SwfEnaaAN+
         Ij8ieElkdh1yf3FH3+QsRRgDKZVSklBB+RkC/4gjb3KdHnrDmrWC+3TJZUUlYaDvcKMA
         OvRe8qeyJE/zwTMlx9iglzau9V3GeIZGlre4Xny+BE1RlTcCxGQtWAo/QsVppjXzO3oi
         5PLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JMQu4Gn5otoimd3DMttkSdiytjvzYgcr7gAsc5DDv9lbBMotWcQjR+ewrQnP42CiuhWADmsivt1NcjlnS@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWX9UbN2sUsNpp1YAzy79h/bi4Xn25mNJPBljtjDqYMRUbGCM
	hdxikq6EDckTFZZpI3zUVaxH71lUti20s/o5oWF5wha/jPkX0YYcoQVZTE9GbR/4aOrrlrRuYqA
	UNsi4PfS78uqmhLn3zpokW0Jt2bwVLnMZgw6DI96hRHoPvgOQxgX1K/oj5SsZVAYgFdnMjge8+r
	DQLAEy7YkgCZNcJHLmhwmOPnROnwxHnT66eO6+FSd2Tq0=
X-Gm-Gg: AfdE7clQx3SKsgJRk0NXH1PyIb43ptKPerJI/9e/rO913MhIv6nI1U2ngNXh4AfoIhE
	9TASQcdKL0rfsY+DryYK+YjnHsj7jEliJDFTRgWN847QHgk1q/6p73BggOt9V25OLDzNddQvDQ8
	ymq4qJi5otVimtecdjlM+cWjSqeyCplExIZRW+aZpZygmAUJJ36gltsEu8bjQRcGfe8NeH
X-Received: by 2002:a53:ac9c:0:b0:662:d600:8f76 with SMTP id 956f58d0204a3-662d600ad2dmr2113298d50.59.1781706257786;
        Wed, 17 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a53:ac9c:0:b0:662:d600:8f76 with SMTP id
 956f58d0204a3-662d600ad2dmr2113250d50.59.1781706257291; Wed, 17 Jun 2026
 07:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com> <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:24:05 +0200
X-Gm-Features: AVVi8CccDL5SethQdiNRDSIMK-0gtwSaPj8YM-cGC3QIWq1yA4AndeXInLTeUd4
Message-ID: <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfX3VP04DAS51f0
 KYHuWWKp2CGkq1LBk4y10TwBF/tCQQ6XuuBooITXuboMQKK/8GLNskz77kU+9CeLQexYjh0i67Z
 9KVd7JO1zS04GE5UOaTxYRQnDm9VAw4=
X-Proofpoint-GUID: Q_4YsyipHnku1U95vkLFOlrnpUyuqQNv
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a32ae12 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=vnREMb7VAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=gxl3bz0cAAAA:8 a=2mLgCmtiJwWTe1bua7oA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfXxHuthHQ8l1PD
 3zhaq4oRN50oPbpPXLywGu6h/vnq6/1TZwX1eMyoARmM3mV5tm1yKA8TEf0ORwXN6rbMiRmh8Hs
 QoKpWCj0m8LvwvlLzkFF0YkZCljbAuMjYTAbQvK185412EbkPCrTHEK+Xm4FS5jN72szsBBpkgK
 mOaa/E9q4NfrBYUMyBhkk1tfqLuduo0ZdnJQu5kstWlp4GXD1pNyKRjm+pqy4Typffnx3QjSoKW
 855V7ILLcZ9NwB4xVxUhapzdRO0+hKg666b+AxUW8mlOigG6b9Cjh2IxhyuxNdbTWe4/qZcTR7D
 hBjrK/85KmbcYiplyHYJGUK5H9+lEyIk7GGP7vak4Nyi1X/euabvu62MaucYVXsl+CUenKFH/PO
 ldwX4qPYbTcqRl+SwwkBhDnPLePipto6UxA4Oz05Wn6t7V+6i2qxlh+nTsWaCaOTeFCQlWhx4/j
 MvJD5XVl6WEyQ+WcMlQ==
X-Proofpoint-ORIG-GUID: Q_4YsyipHnku1U95vkLFOlrnpUyuqQNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113655-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oldschoolsolutions.biz:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A792E69A828

On Tue, Jun 16, 2026 at 11:09=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
>
> Let's go ahead and add a framework-level sync_state callback for the clk
> subsystem. If a driver doesn't have a sync_state callback configured,
> which is the 99+% use case today, then let's set it up to use the
> clk_sync_state() introduced in this commit so that no driver changes
> are needed.
>
> At the time of this writing, there are currently only 7 clk drivers that
> implement sync_state, and all are Qualcomm SoCs where they interact with
> the interconnect framework via icc_sync_state(). A shared helper has
> been created for this platform that calls clk_sync_state(). It is
> expected that any new clk drivers that want to implement their own
> sync_state will also need to call clk_sync_state() at the end of their
> custom sync_state callback.
>
> There will be several stages of disabling unused clks:
>
> - The first phase will be executed at late_initcall and it will only
>   disable unused clks that do not have a struct dev.
> - The sync_state callback will be invoked for each clk driver once all
>   consumers have probed.
>
> This is based on previous attempts by Saravana Kannan and Abel Vesa
> that are linked below.
>
> This change was tested on a Thinkpad x13s laptop.
>
>     [    0.308051] clk: Disabling unused clocks not associated with a dev=
ice
>     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling=
 unused clocks
>     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused c=
locks
>     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused c=
locks
>     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused cl=
ocks
>     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused cl=
ocks
>     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused =
clocks
>     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused =
clocks
>     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unuse=
d clocks
>     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling=
 unused clocks
>     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused c=
locks
>     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:se=
rvice@2:clock-controller: clk: Disabling unused clocks
>     [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
>     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
>     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
>     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks
>
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://www.youtube.com/watch?v=3DtXYzM8yLIQA
> Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@googl=
e.com/
> Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@lina=
ro.org/

For future revisions, please add ulfh@kernel.org on to/cc.

> ---
>  drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 59 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9cb2b42d1be4..7a15cceec620 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[...]

>  void clk_sync_state(struct device *dev)
>  {
> -       /* Will fill in */
> +       __clk_disable_unused(dev);
>  }
>  EXPORT_SYMBOL_GPL(clk_sync_state);
>
> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_n=
ode *np, struct clk_hw *hw)
>         core->dev =3D dev;
>         clk_pm_runtime_init(core);
>         core->of_node =3D np;
> -       if (dev && dev->driver)
> +       if (dev && dev->driver) {
>                 core->owner =3D dev->driver->owner;
> +
> +               /*
> +                * If a clk provider sets their own sync_state, then it n=
eeds to
> +                * also call clk_sync_state(). dev_set_drv_sync_state() w=
on't
> +                * overwrite the sync_state callback, and this call will =
fail
> +                * with -EBUSY.
> +                */
> +               dev_set_drv_sync_state(dev, clk_sync_state);

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains (genpds), resets, etc,
as in the qcom case, for example.

For power-domain provider drivers (genpd) we also try to assign the
->sync_state() callback, see of_genpd_add_provider_simple() and
of_genpd_add_provider_simple(). This means the above doesn't play well
with how genpd behaves, so we need to figure out a way to manage these
cases.

In this regard, we also have of_genpd_sync_state(), which allows a
genpd provider driver to explicitly call genpd's sync state function,
if/when needed.

Unfortunately I am not able to suggest a detailed solution for how to
move this forward at this point, as it requires some more thinking and
I am heading for some vacation very soon.

> +       }
>         core->hw =3D hw;
>         core->flags =3D init->flags;
>         core->num_parents =3D init->num_parents;
>
> --
> 2.54.0

Kind regards
Uffe

