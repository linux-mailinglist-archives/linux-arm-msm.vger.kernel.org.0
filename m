Return-Path: <linux-arm-msm+bounces-96145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ruqNESt3rmliFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:30:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B321234C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 702F43013ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 07:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A6A199920;
	Mon,  9 Mar 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSFBYzch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6/1Gvy7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D552D7BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041448; cv=pass; b=ExwAbo0YVXosF5g4MxkgX9cn+QKV/onma9eOy4Yak08yacEt/Mc9u+Y1u7GJrWLOoD4LSt40+8y7/snyNPTxI4rdEwRXCaWdPTiRrRiUCJD6xvCqXnpIR1EQSwPZIwME9XGC7oMullwAk4Qax6lufpmWrFsPHdl6kPp5DYBErwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041448; c=relaxed/simple;
	bh=Kd8qJEQ1MJLL0QfvPt72Ua3hnI5RJ/rb/CwYYMsza9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q19vIlZduTG0Q0ro2WwgzS6dx0koNBuMstp1Jjd/0fheLkWidWvJsP7Y6BoDc10xUjL165M79Y9yEdaqzeVCh2QwqucghcAa4GYSocCEsHX8rENSKVF4d1700fWKWQNBFK9Q8iF2EcoVD2ukCKNI9Oc+qbWeWB0izs4fLUiD3aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSFBYzch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6/1Gvy7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N1pUC2663851
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 07:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vgyV+Kwyk8s5UKBM6CVvq8A5daBL1eUe5rh4Kx2894=; b=RSFBYzchkx1FJOkU
	MSQihrtqCbBriUU/UThW3/sACa3gwCpnDJS1F1MHLzbZtwHgEVzzg9YU/BB9FeyM
	FqqlvLcdZiu2627KnFin5jCxRKRPi60KfPfyOYUODjjIhxfgAUDzvSYp7U0ZTVEp
	W/8/cN+vX1RMI/0S9mBb3aak1m5bJPygWcUvtjLLFq665QEJYOPBW792BvxO9k68
	RLO6O6k2OjGks3/8L7wu+G7J/p1DwGktcmm9Y8mkqHAzp8HTzYtflJAmDQpWt1P9
	jkAJdC6fDxbnRmNQYywgjl88sdUCYq/D9ficpnRqvVlYp0uXhdaHZWvVUqNrLgTe
	kRCbWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpmmjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 07:30:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be191ce356so8025461eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 00:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773041444; cv=none;
        d=google.com; s=arc-20240605;
        b=CXPPTBwXSMXE8DIdPYKFdBzSLYc7fJeyymMKrqB4Zk6cenPIS9sJsj4K1L8nEmOzrf
         m4lIeO5Lq8VtWankhiIDxZMHMn1xpccPxBiEI+J+ju5iftQVRHqbYkqA9RFsx5uDcn58
         bVjooKeYvPpZqchQWDlYvuE8OOpssA6NPQajsjl2Z95gpoH5M43z1PYrUUYhujWOaENo
         oDhcmu6MP+D6OKPN+5HvC2Y8MfFxedt2IbBhdDixj660r2MFvEYDfoQ7zdIKtNnAIZpG
         /jOuWkoMg49prHHXPPhygxO5bkfKS1zLQeYAsJLrg0n5me14I7Qbvz9hPkxeRgHfpPYW
         9yHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6vgyV+Kwyk8s5UKBM6CVvq8A5daBL1eUe5rh4Kx2894=;
        fh=HH6b+XeVyb3ssOz5VfGUwNPhiMRrr1UblSCOgTZy1Ew=;
        b=YeaPF1RhPRUyxGzi68E1fcVv2W1A3cnEkJzTaY+iawR8GCXeZ4RvVxdX6IBv9yR3aX
         FlprryrICNxxq5FUbyamSghBp3sOIrRhQna/50/C59Xulid8DOPi+y0uhF94X57c388v
         XAFzhClI+9nWHjREwCGJBZC5Daz3HlBS0u3mIcoZVADUsYMI4JLh8KQXQa+0CrL8lZ8a
         c1f9x6ntrVa0VU7ZbP+zppOHRS3VH9ZGQ6e6cxr1FJOBFtaAgmcItDHnGD8yVcTb+9uR
         7Nl88Yb7atoaC8ZYzwyTSRk399mNcF1b1g6lIpQBvEQBOdI4oWD7+bwjXzaGsfFckjUJ
         4UnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773041444; x=1773646244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vgyV+Kwyk8s5UKBM6CVvq8A5daBL1eUe5rh4Kx2894=;
        b=Q6/1Gvy7mh+NwQGngFQ8eA3klw/zVldQh2efbXiJz0NGl7rhU4RtbdlS3hkvYwnlDj
         F4xikf9sTyhzsU88WtU5Ai0mw5IrGcRQeM8qQ2kuUgs0ItwctiMNUzxg4ZO0G/vPex58
         IRXHTWjqrrSEbSNvFAv0cnv0e2j5gNz0Fb8X3ieyTaxYCcUkXePxDmfEsBKysnMzfEE4
         /fFC855a+oXXKQeXIcnpTr6g7Q3UrLr/FjFzfR+tOwtclyZtQY8zBe6WJizw0RKCXZxr
         f+uuqBhhzI/fsvWqjPvJZJRYOD2o1YLQpE//1ocacq9kqr4R4CidnSOmpcw7wKPeOuvL
         EfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773041444; x=1773646244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vgyV+Kwyk8s5UKBM6CVvq8A5daBL1eUe5rh4Kx2894=;
        b=w7PKleyJJbmXclo2OnCG0FK0zNcYSK0f3toDvJdC8hO70WdNGmmSjUHqLLK5dmyS5m
         AyvqE0/3q2FFT627SiY4Fn6jPeNETiE4sGS/KWCNNFuE7IUvhFC9FAC9HDYWu+dbxyW8
         rMl+s8zWeEiAuqebdEPNkX3QTD6vyK0HNQLBj3g0beI6AjdeVV82Q5ztOEp0Els8w1bB
         eHPclm7kGqnzdhENtzWahSGt7DHuxx/WocrV+sDBdiZc5KKFzNL5VsreInThvAX/rWlH
         GuysMmEjH1OlsxcbHtabmolK+PRJsk6oMFZJR+X4YdHvmhYgQMiVAYRIomgpmlVFrn9H
         OOhw==
X-Forwarded-Encrypted: i=1; AJvYcCV9N8hpnXoG4FDSzpKJ5w4SJvMfTkc97xDFoHwKEiIOVAjRFi9rFRMkPikWZFp3iWGxV3lKhHjhQzearSqW@vger.kernel.org
X-Gm-Message-State: AOJu0YziuXuB9VBOu/HNTlgguGZEv7QhRG+JWwgcpKD89Wc7S1XjB6Cu
	ZITXrbh7f08WgvBUJ5Nn65tiAGr0Aud2FiGRsjU52/bVBpvfaiJEOLu2IKOaFvfRGDa78VORbyu
	Gbft8OaVLQkP2zL/O8o9HJH6Y5DvKh48RhJXC9FVVurmk5y6MmCgYi9oWMpfI4mB6IgzuWP7D+0
	OqtHsVbxkAYZQKzHBElcbZyE/5++VaUK5i5/9D0rkFgyA=
X-Gm-Gg: ATEYQzwW69tSIKwVTqaDzDTO3+p7X8ornSsjsI/J8XBU+gsRKkHkok7qjUMX22nh8ir
	1/6pOk8xpTGOGhupHbo4rdWMnBYBLAGqPX/+e+jcncNFdHL9labZ9iVvQMqGhew6vv7GJHmH852
	b1uBmMq3sgg1HIR82Fe+hC7eIWRk79kvbqndoawIDpQDmWPLRmLAav6eg5Dho6jktrF7IIkEUSy
	LQjM7M=
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id 5a478bee46e88-2be4deaee17mr4001090eec.13.1773041444355;
        Mon, 09 Mar 2026 00:30:44 -0700 (PDT)
X-Received: by 2002:a05:7300:80cb:b0:2bd:cbc7:16e2 with SMTP id
 5a478bee46e88-2be4deaee17mr4001080eec.13.1773041443825; Mon, 09 Mar 2026
 00:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-qcom-ice-fix-v6-0-4dd3347df530@oss.qualcomm.com>
In-Reply-To: <20260309-qcom-ice-fix-v6-0-4dd3347df530@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:00:31 +0530
X-Gm-Features: AaiRm52VPpypDsuJ5PtJbOzCheET4KyzNoAC9-1s0jjopDFrH_S9Z9ZnkapMfGE
Message-ID: <CAGptzHP7g3frxtF2UKfUj=TJaJQobX3FrTb+eqRE6p8JPDZjEA@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2OCBTYWx0ZWRfX0kwHwYMnhzQq
 Z8X6dC8hO8wKh2XYurSVCsCkjA3OSBTDeS7YHSh18Mcg4he+db7URiSXs4woyYzeANGzMAThxvz
 DcGMO4Ao0KzqsMbAaWI00MvMZx9emmxuqjraMYEwX6Oh8fZhAbsDqcKM+fA6PWjVxV9kulbbCeh
 aQF1UYgUQeIqejvuGFRcecwQv/8bbIgX54zhs2mnYieb3rah0db991Jz8ScbdiQnX6b/BLONBlW
 ek1ZY07/trBcH9BM4ymgY1o+XxA02miaWj+FCIT16v5tSc9a8r4BzV+cGmwiXSfFTuc4HxMUjfX
 MBREfdMwsDn2Q3Bg6NTAw6mHMz9Lv3Faob9pWpR9PI38f/4gUDb2/JGeOi0DxkrASZU0bNeV/rm
 j640/REpn3M0tz+imTRsEW9MFNb3LTjuQ3C9xhKx6eB5IL0Y+4k/LNP+eFH3mt9e/E8u1qGS9NZ
 ++6E7cuDP94q0aMd6/w==
X-Proofpoint-ORIG-GUID: UbAkTxs79-oOFVUiiIwc5vpqqO2dtCHW
X-Proofpoint-GUID: UbAkTxs79-oOFVUiiIwc5vpqqO2dtCHW
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae7725 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=D8yADozZ_YwZBmLQuGgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090068
X-Rspamd-Queue-Id: 8B321234C93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96145-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.945];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 12:28=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> Hi,
>
> This series fixes the race betwen qcom_ice_probe() and of_qcom_ice_get()
> but synchronizing the two APIs and properly propagating the error codes t=
o
> clients.
>
> Merge Strategy
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Due to dependency, all patches should go through Qcom SoC tree.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
> Changes in v6:
> - Fixed sparse warnings
> - Link to v5: https://lore.kernel.org/r/20260308-qcom-ice-fix-v5-0-e47e8a=
44b6c4@oss.qualcomm.com
>
> Changes in v5:
> - Used Xarray instead of platform drvdata for passing the pointer since d=
river
>   core frees drvdata on probe failure.
> - Link to v4: https://lore.kernel.org/r/20260302-qcom-ice-fix-v4-0-0e6574=
0a5dcc@oss.qualcomm.com

Thanks Mani for taking care of my inputs, this patch-set works for me. FWIW=
:

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Sumit Garg <sumit.garg@oss.qualcomm.com> # OP-TEE as TZ

-Sumit

>
> Changes in v4:
> - For supporting multi-ice instances in a SoC, stored the err ptr in plat=
form
>   drvdata instead of in a global pointer.
> - Link to v3: https://lore.kernel.org/r/20260223-qcom-ice-fix-v3-0-6ca584=
6329f7@oss.qualcomm.com
>
> Changes in v3:
> - Dropped the platform driver removal patch and used the ice_handle to pa=
ss
>   error codes. This was done as I learned that we need to have the platfo=
rm
>   driver design going forward and also removing it introduces other issue=
s.
> - Link to v2: https://lore.kernel.org/r/20260210-qcom-ice-fix-v2-0-9c1ab5=
d6502c@oss.qualcomm.com
>
> Changes in v2:
>
> - Added MODULE_* macros back
> - Removed spurious platform_device_put()
> - Added patches to remove NULL return
>
> ---
> Manivannan Sadhasivam (5):
>       soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_g=
et()
>       soc: qcom: ice: Return -ENODEV if the ICE platform device is not fo=
und
>       soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get=
() instead of NULL
>       mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
>       scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
>
>  drivers/mmc/host/sdhci-msm.c | 10 ++++-----
>  drivers/soc/qcom/ice.c       | 49 ++++++++++++++++++++++++++++++++------=
------
>  drivers/ufs/host/ufs-qcom.c  | 10 ++++-----
>  3 files changed, 46 insertions(+), 23 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260210-qcom-ice-fix-d2a3a045b32d
>
> Best regards,
> --
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
>

