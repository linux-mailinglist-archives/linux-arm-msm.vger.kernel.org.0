Return-Path: <linux-arm-msm+bounces-113660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0HCYLzjAMmpe5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:41:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CEF69B168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:41:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KgQCkMl1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wi4VAmLp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113660-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113660-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DDDD32CBA8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DB148AE3A;
	Wed, 17 Jun 2026 15:30:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1753A48B378
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:30:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710214; cv=pass; b=TZzmHDxl+pK489zuvc16wJeanwJU+whPiMeJSlcDooAcP0O6IveKMiJHUy3UAOAvPkrmk1hwfm0pPor0CUhitfRiq0W8G0i6uo+0hUzajTqvLdr/ExwjrehzlE8iw3kuaNVyRLccUEtmF1OKT8Vhorq6usIJbddU+WkE4b1OBuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710214; c=relaxed/simple;
	bh=PdbBXH0j97SSuuoa8Us1kKhdcnIElthXGwVwFDKhnQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yb29beSuqe2ljRhGPqEK2Gqh+F7pqu1ELQ2zziGEgTbq29jFcWbtuFWZYu2XUeusx59y+33P4dAUWSDcaJkHMhdmPhUtizv2D1zBRVFGYPxZHKmSEyh2BMk5Q/8JNaC1WDGmyBydBKwvfDCSIl4/7Jt7wb2gFdDFWApZiBZs5OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgQCkMl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wi4VAmLp; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFPqBQ2959748
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaGmouA9GvKJhmrNGdFRr8DH6PO9VNFYa4WAVUcNzNc=; b=KgQCkMl1MInUVhqR
	w7mskElIHSU2oraqB6AqF93AjlPg8AczTFqrVsv1+9EtTDPsjaDMr/c74enI8kIH
	07KOTcn4dFohAp93J/izOWouvereVi1ZoqSHb5dNL1JMbVV1vxnL4UMunXz4SkR+
	z/PdY12KtwzIMc1ES4Fe+kAgJqkwp8BTFTQiRfauOY6bsXasCJeG9obCJ1pXyx6H
	JvbuzX/1Ac9zc8RJHnbbKi0LuQX4MQYkQB3PDIOb3EbfWfMGb6Uzo2A1KRRULQ6y
	uAAiCgh3l8Z1a8RRT6RCzVpJc+Z3vyRCk9lfXg9KDYSTmWCBP+PqCLRlIJ0etq9m
	Q0xsIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees3w2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:30:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dae6572676so25350916d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781710204; cv=none;
        d=google.com; s=arc-20240605;
        b=LUiGHysmD9chm8QytSnnxQNJEfxtblFSN4kIkLFDCtz8pmilqTsdAk+QOhlxynQuzc
         dPhX2J3KO4D9sHjXXpq+RfMZIS9vIs+x6UvxISYOmyxTFYck3yDk4wISUKGCP9FjVU22
         2UL7SbZjbQLbdiVYcx9FSq8AhmIvxXAZtilz1T9UWHD20iLzOV02SR0XyLdINhaL5tED
         zojoG5dqkVJjcvLa6JrOfPV38u0c2HSQLJorDYrAoyevh3JLYeM9BqXuafQttbv54wGL
         emT3od1V0s6ppxMhhDSV1vsgc2KhAxR0GpbmfEEYq1DRB2apM3ba5UlPMjX+ReSipoXU
         0p3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eaGmouA9GvKJhmrNGdFRr8DH6PO9VNFYa4WAVUcNzNc=;
        fh=Qdoc8EvRst0ATY6o5FsuB1j5867k/WzxEXjcfyFmD6s=;
        b=KgAj08OqE8hlUt3nISqgGD8jXudI8qM9fO3ST6gU6C0xHPGrOPdEz73CN/Nnk6+i/3
         ac8UAqT4NY7OJhW+rGW1ZGUm84TpDdQKZjQNT9weL3BAVivanW3ZN9+sQv+a3VgJW8LC
         J4lWzLbtWV39IGWlBjbecIb2lchzW+/2PRfepU06ZpUCq7V2At3kPkZW8cXSReTb6mGz
         8pRnuGRimbhiqOglOXnzix+bRs/74cEhcL3zNMcNOZCzYxfZjQxWrjGXn+bYg6i/vE6n
         MdSQJhZxLQ9N78fjNfrxr6vFKNfDwvmo1ULFoB0px+wBEGZe3e5WHXvfmTb4QmXRX8oA
         fWcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781710204; x=1782315004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaGmouA9GvKJhmrNGdFRr8DH6PO9VNFYa4WAVUcNzNc=;
        b=Wi4VAmLpjgC1ropbIBMm8Pt5c0GN5qdWAgGtnEooLajmhFmqYMI45VisNiQB/BWdG7
         1SykSY9HEACowZE/3DDtMhe9bKVkFyA0vtn/c1DSRi2avh4vE9Liv3+zexA0QoaQtQr3
         AiKhxrDJGPyuOksOv6RbIP73em3N29+zhyU5dU/sEUFhVXN4+IxMkbfY2CgIaGw2L9+r
         5lu9zIEXdEeksjjb7p65ff3gBE7RejFC4dB5RNQ/2ZF4qTzSAQVhWCKx2rIN4ZRf0eFS
         XVqFULIms6yQZ7QdXoAOKp8ESmAZ79ZidUXoRl1qaQ/+2Qbr/aq4cSjup96SHRCDsL2m
         py1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781710204; x=1782315004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaGmouA9GvKJhmrNGdFRr8DH6PO9VNFYa4WAVUcNzNc=;
        b=Z9uum8y3Myvh+Sx7N/duGmHIfxqzHGtl2+fEbGgop0FdBGCLnJy3uRhU9F6fibXtmY
         psBxNEa1Lqg1fvCsKAeD8IhGtRib5yAGhlQ9xT9rNsVzacvv+yU2vuyYV55RBxew1Ww6
         ms2xv8Ru/OkGWkZVf5TWNVtPdejPXm34MDGYDIxcJmc4RIV7+uRLUqt74+7q1/yEAtZ1
         dBhWq5dYC6xBRSsRBR1Xanj23oIAApjrNSawOYb4/DUFde1kvZGR4/TOw9ghhTiuUg2+
         QxH9wj45K+yZB4dGfOrPv2KtYAeutFaZaS3SFTVY8Of6TDDetSBsjVoli5QHcdRL+OCH
         mwYg==
X-Forwarded-Encrypted: i=1; AFNElJ+dn8G25YtkK5twOI/nWaH2P5E6cgu2+YE4C1DmjEUa0ioSib+GEz4T84fAt77d2AySXjY5eQHVVOiTSEMy@vger.kernel.org
X-Gm-Message-State: AOJu0YxymuXD6FLJqGhCXFgLSLDbOiHIUyxNY1cIQOWiQH2OcEF7z2xA
	wjG1IaDEkhnCPoqD1m8Jpta39whn/BPCeefNW+4aofOYP89gf8cUbGQ0PdYkYjBzTh9yZ3IN2hz
	ZtSf23WfETqqWAqXQQXC2NEitC1qleBxtUSPTw5mZBuPAbUU88Fl11FV26DLnEwiCTS5ucLQ6Np
	MSPo2aJbARYkj5EaFQP59RjGL51XHHSVt8Ns1P+z1FJYE=
X-Gm-Gg: AfdE7cn8lOCz8vtDpV5H09C/3D/RxF/zHOVCuzyAaynAZpq1Mj3yZeKQiNsUT8Bb7e1
	GktCdlUigNAaC5ELI8PbLIlucs0WCCZf138fFhSPhg3tOQMxTCTtY31M5aPBQpVbd+p3gFIl//v
	CslSX3pahK3uMsa0I4XMZ6bjT7twfM9oC3tUYCKFR3SpNReAyYkzpZ5ksRjNFKEwJujueg
X-Received: by 2002:ad4:5b8d:0:b0:8ce:e098:d974 with SMTP id 6a1803df08f44-8db5b6b1e44mr74422256d6.6.1781710203395;
        Wed, 17 Jun 2026 08:30:03 -0700 (PDT)
X-Received: by 2002:ad4:5b8d:0:b0:8ce:e098:d974 with SMTP id
 6a1803df08f44-8db5b6b1e44mr74421106d6.6.1781710202624; Wed, 17 Jun 2026
 08:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com> <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com>
In-Reply-To: <ajK29WcueJ1wLCLQ@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:29:51 +0200
X-Gm-Features: AVVi8CdBppTwLSIbwBxFbO-ZLgfR62v18Kvo1pxBt-9HjS9Gqtl9Fmv4ijiYcGQ
Message-ID: <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: 2219vvZ_6R82whLc9EC1iTMPDiZPYatw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE0OSBTYWx0ZWRfXxMY4w9LJT41d
 hDygksI3gE/YM/FJ3agJq3hx1ao2kRCbpt4PoRtBRQ9jglFhYH/ZcW+mghl8SxM9424TAB+XiqH
 ErX+uNq0bIkpxw7zbBorF7iLMWE3BMagnFLxEEPL4aSsYbcEWkLg828Vs73qz5hiJVHrVhsY4vF
 as7Ct5OLwgGFbBgGtrR0sDwiLCioOpYeP1tJ37oyxn/JDmlkJ7Ng5cTiqaYYKq95vmp/SecU1ah
 k7lRUq6Xefa5AMEsEHShW0Gu7vrHHOMooOhr3JYRyMpW9hibV2RSmY1U2zWdF2Z9Hgw5DJRb0kR
 sA+rDA94YrkYTuR6IyD9G8gF9ntt8eBw7UMW4Y8t7qP5GpUjEWuBakenPqDTPKOaaYrq9jidtam
 W6ur4T//OGWi7aNZa6P97Log6PTSXZWnphsXzHgJVamahKlgra4bSefk2yVK+2n1tp8I4NNzEts
 /mWww2RMLJbEYH0fxCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE0OSBTYWx0ZWRfX+Cgzz24+puLc
 AZc1XmkJ6R6bnFu1k6CvbhBBiS0AtBWak9Enlbf3oMR9J8QE3ZkKOsFLNCBFmO0JcVoOzv1nhc8
 MoDu/kWcEuKgWiLYn07QMeiCW4sPjY8=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a32bd7c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=vnREMb7VAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=gxl3bz0cAAAA:8 a=ZDpw0H_dkynez2OnbM4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 2219vvZ_6R82whLc9EC1iTMPDiZPYatw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113660-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oldschoolsolutions.biz:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15CEF69B168

On Wed, Jun 17, 2026 at 5:02=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Ulf,
>
> On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
> > On Tue, Jun 16, 2026 at 11:09=E2=80=AFPM Brian Masney <bmasney@redhat.c=
om> wrote:
> > >
> > > The existing support for disabling unused clks runs in the late initc=
all
> > > stage, and it has been known for a long time that this is broken sinc=
e
> > > it runs too early in the boot up process. It doesn't work for kernel
> > > modules, and it also doesn't work if all of the consumers haven't ful=
ly
> > > probed yet. Folks have long recommended to boot certain platforms wit=
h
> > > clk_ignore_unused to work around issues with disabling unused clks.
> > >
> > > Let's go ahead and add a framework-level sync_state callback for the =
clk
> > > subsystem. If a driver doesn't have a sync_state callback configured,
> > > which is the 99+% use case today, then let's set it up to use the
> > > clk_sync_state() introduced in this commit so that no driver changes
> > > are needed.
> > >
> > > At the time of this writing, there are currently only 7 clk drivers t=
hat
> > > implement sync_state, and all are Qualcomm SoCs where they interact w=
ith
> > > the interconnect framework via icc_sync_state(). A shared helper has
> > > been created for this platform that calls clk_sync_state(). It is
> > > expected that any new clk drivers that want to implement their own
> > > sync_state will also need to call clk_sync_state() at the end of thei=
r
> > > custom sync_state callback.
> > >
> > > There will be several stages of disabling unused clks:
> > >
> > > - The first phase will be executed at late_initcall and it will only
> > >   disable unused clks that do not have a struct dev.
> > > - The sync_state callback will be invoked for each clk driver once al=
l
> > >   consumers have probed.
> > >
> > > This is based on previous attempts by Saravana Kannan and Abel Vesa
> > > that are linked below.
> > >
> > > This change was tested on a Thinkpad x13s laptop.
> > >
> > >     [    0.308051] clk: Disabling unused clocks not associated with a=
 device
> > >     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disab=
ling unused clocks
> > >     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unus=
ed clocks
> > >     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unus=
ed clocks
> > >     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unuse=
d clocks
> > >     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unuse=
d clocks
> > >     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unu=
sed clocks
> > >     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unu=
sed clocks
> > >     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused cl=
ocks
> > >     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling u=
nused clocks
> > >     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disab=
ling unused clocks
> > >     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unus=
ed clocks
> > >     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gp=
r:service@2:clock-controller: clk: Disabling unused clocks
> > >     [   21.081996] va_macro 3370000.codec: clk: Disabling unused cloc=
ks
> > >     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused cl=
ocks
> > >     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clo=
cks
> > >     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused cl=
ocks
> > >
> > > Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > Link: https://www.youtube.com/watch?v=3DtXYzM8yLIQA
> > > Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@g=
oogle.com/
> > > Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@=
linaro.org/
> >
> > For future revisions, please add ulfh@kernel.org on to/cc.
> >
> > > ---
> > >  drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++=
----------
> > >  1 file changed, 59 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 9cb2b42d1be4..7a15cceec620 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> >
> > [...]
> >
> > >  void clk_sync_state(struct device *dev)
> > >  {
> > > -       /* Will fill in */
> > > +       __clk_disable_unused(dev);
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_sync_state);
> > >
> > > @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct devi=
ce_node *np, struct clk_hw *hw)
> > >         core->dev =3D dev;
> > >         clk_pm_runtime_init(core);
> > >         core->of_node =3D np;
> > > -       if (dev && dev->driver)
> > > +       if (dev && dev->driver) {
> > >                 core->owner =3D dev->driver->owner;
> > > +
> > > +               /*
> > > +                * If a clk provider sets their own sync_state, then =
it needs to
> > > +                * also call clk_sync_state(). dev_set_drv_sync_state=
() won't
> > > +                * overwrite the sync_state callback, and this call w=
ill fail
> > > +                * with -EBUSY.
> > > +                */
> > > +               dev_set_drv_sync_state(dev, clk_sync_state);
> >
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains (genpds), resets, etc,
> > as in the qcom case, for example.
> >
> > For power-domain provider drivers (genpd) we also try to assign the
> > ->sync_state() callback, see of_genpd_add_provider_simple() and
> > of_genpd_add_provider_simple(). This means the above doesn't play well
> > with how genpd behaves, so we need to figure out a way to manage these
> > cases.
> >
> > In this regard, we also have of_genpd_sync_state(), which allows a
> > genpd provider driver to explicitly call genpd's sync state function,
> > if/when needed.
> >
> > Unfortunately I am not able to suggest a detailed solution for how to
> > move this forward at this point, as it requires some more thinking and
> > I am heading for some vacation very soon.
>
> One approach I initially considered was to make it so that we can have a
> list of sync_state callbacks that can be added to. I already did some
> work on this, but I didn't think it was worth it for just the QC clk
> drivers in isolation, but it would address the concern here.

Right, maybe that would work.

One more thing to somewhat consider, is the problem I have been trying
to address for power-domains providers [1]. At least for genpd
providers, we need a more fine grained sync state solution, which also
must be able to co-exists with other subsystems sync state support. I
am not sure if something like this is needed for clocks too?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20260508123910.114273-1-ulf.hansson@linaro.org/

