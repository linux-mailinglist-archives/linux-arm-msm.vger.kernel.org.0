Return-Path: <linux-arm-msm+bounces-95736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBriGO+UqmkkUAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:48:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A902621D54A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B25BC302065E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BBD3264D5;
	Fri,  6 Mar 2026 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NnXx+cbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AM17GEDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FF25DD1E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786874; cv=pass; b=kFLGO1mDLYKpO2L0A8ArvJQPv5szsMLwDobZ7n2skgQgMxBEZJklyb7p00X8X4AE0JvZ5O8YWA9MiyQmT/IFqBTfvn+2I5NVmSTVvVk7Ti0xjWHejg2tVDdezqWUAai1FX7jInNFLq78IQ1wAqQ8G4kNkv527Auyu28qZrOlVHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786874; c=relaxed/simple;
	bh=ZaBQ5tkLSmw9g7b8fhNlWVbbux3qphLUl1rPCiwF2zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loCRAHiwsA2jtFSGjMxjQU54EUTUy2blSR2K4ZDFRilM+3uw3j34OxJGZTHp+GFejaTSx6GmbTifmdGuDOjjSCIVOasfyd97ObQsFBiUbkPaMuHnSJKkW1fYXqkH8Qkz88pUronI8yUy+29dcAnQDULeguHEUSUhBxihT+thA78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NnXx+cbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AM17GEDn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aXTM2483357
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2ApZDaJcSIzT6mlxuYP1CqmneNlNHGPXDzmji4RH34=; b=NnXx+cbbq/HsKF8R
	LEVMtBHS5WQZGAhSPbl3kITrHa8CHRR/Zh9CxkCjtAp/7KLlutfy5mJKEOzpA+1t
	XmzVegaMVmw0qQmKsOXdOwjJlkCruDm4t0+c57nP1UzOzfZGDMnH2LrcWZkpyaL3
	5b1zKViUky0JLxsIMi0Jp57YiomiFtlGxXsu/G78dEpKlXItttOl9mTt+r0oE60O
	Ig9WBY2hbaNeOg+2eNiclZ+sEiiQCKG1Sfdua9RnfM+hOP6M7tsM/m8oPv2gcL3M
	t+2+GD0Pm+hl4QDXRMWhLxbMJCASiUpXgBbhD+Cew0eUYT6iPpa4IDckfFF2wYLs
	7FaiRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wbxtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be232ef3d3so59488724eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772786871; cv=none;
        d=google.com; s=arc-20240605;
        b=U4tU14UhM304IwVjE+JUz9YLMGH053Yxf4C3ckkERoj7XyleHJcsz9UO7X5y1rF+il
         Z8pr3Gp28+ipyHFc15rMBc8k28qEryqLGAGMsRqqGOke9l7iOVQtKnx0Hj0B3/PgPjIL
         2NBnwKqEK//1wYnTGMCr/8iDFAXxkYLTJ40uPX1mFlsOCV+1m6uv3KTgvdndpRMfm2Uq
         8XVBkVKmUw3MDyHHMkHjXQqNGbiIknU8wMhgo/POSYzfSQLCRbwz2RRl1Q5L8SHeaEEo
         C5zw2j94xxeLxI9gYTno5ClxyLYdJUXLSQkNFxSZetv4JEcmbmm1W3tpN52hnirdnwye
         sUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2ApZDaJcSIzT6mlxuYP1CqmneNlNHGPXDzmji4RH34=;
        fh=z+EXvJUjr22M/KKLJXzNl2iPOodYpsbWBpBmcfyNWZs=;
        b=gRqA5w4jvlQDLi6X7oIcbfNIhKGN0oWjS2A+wWZEHomWrVcxLb959MSIMYfPwxDymV
         wv99TjgeUauop+n3Pzc0GAzOhAvANupg+jSqo1KkYIPmlxWO7z4AlfZISSaVYx1qYNp+
         EYbA6mK9gFSdxOpl0yjYuyiyFVxYuWmQqP9EIP2TE2cn5OCAoQgeRW+3ieDP0laCrKx7
         qpD25X1wnfwR+903zj//BB5RTSMuqirHwSv8f8VXmKswBMpd3d0MD2VJAiNCOp//n4MR
         buh0eHy4ddPNryO37vyw/TwCnJK8aMxCxwsGMx5BCofyv0Mm+yv+hF5VnEKhFw55c2Do
         lguQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786871; x=1773391671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2ApZDaJcSIzT6mlxuYP1CqmneNlNHGPXDzmji4RH34=;
        b=AM17GEDnjgW9AQdNrxY79zzhyxZdNDS6MjMAF4YEBt6iWLja55bEJPBdL9Ah0etxks
         F7V1BQX4Vp1zS9dCwVzQqHZBEOmkSn22W4pnDnNIQo901GjA59AmMziZDvmBgZK7jLZ/
         u0cXsGYSM+5QwPaMEjUGrzl0PcUPZZVOHskddyJ1acKdOKj1XIFL9xoz4GiY0NFiCwKX
         U0aS1Fs5fMEptn6eLo92XESn9gKS92Sj39XSwUvAbqqFG1dKp2MY5mO4HYE/cV8zVqSZ
         6E9UzsSXFlvPKu7l3NJJFsdAHudUq+A1Bw+5BB+cvK3KnmAi9vdy/7GCglYB4kMmSD01
         oVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786871; x=1773391671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2ApZDaJcSIzT6mlxuYP1CqmneNlNHGPXDzmji4RH34=;
        b=tCUoC4qcT3PksLSuap6I2khQjWPcsw9UMJvqJeR+OUTvWV9W/wT/ilSSdzm/cByRwy
         3Or9+yZYTZajneUESwGkjZa+toFJbF4RFHz/PhLM+DdJNmayXOOmBQ5PrNT1WruSg3Ej
         iZ2Y7w8H+aJAZaYGbDFqqSat8MC6T+qsSTQ4CFWSAaqHJeKmlvGqHsQbRnxh4vvxgyEt
         HpOznEC+woPj19cbbVJdg2G6fN7xvbqCVMLXx4+TiXzVhaWc3X95q1emtyw/Ukw5/owk
         6sh4g97Gk87GDabgJXxuSwtx7hpOvuv3WiagH0D7qSEvTM/dUrVL3iAnYJqbnhlvIoOS
         UlYA==
X-Forwarded-Encrypted: i=1; AJvYcCWnlgaXhCdKSrShEXUoDTSguENcTzm2NSyJVNh8QYtxNPDYOGCyfpSqgca68dtpg7qgJuPKfVsVMeTudFwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YygTRVRmUR7w7ZqMdTGkHoOKltGTizJitalVE7pSnyPb01dwjqU
	HYYz0ySbpyoqXAOYo017s9aZPTPO4tsbzMzb2U6FCx4x5F45Y8/TDuo55aEtRWibdsYaX56my/t
	/4t9YcxeI5hgeW8j9GCsU4My2gCp7lo3hDIgXpaoErMzDcllqPEZHHpjywjHzVoEh244r8x2SDW
	4XCQ5EtKM329nqf/RFYW3xyKBH8yBCnaONoI5y6b/GnNc=
X-Gm-Gg: ATEYQzwn4vjfb+U4kvKdChKvqlT0b1z4hS+3XMdXhKSF1SiMx2wbctN1nGmrzb8NnRS
	fuoegmcUMo57i7fVQBX7TwnFgKX1z1ulZ5ZTU4azi/ub/iOUc4csdMwJgprVzR8Yp1DkEawq8gg
	fE+0XOvGY24ntbDuIS0rk9BD7fhKKNzMJnjMXN4i9SMqHcMqs6hXwRR+Yc01VU/RYJ6sXcibb3R
	gB/OmUz
X-Received: by 2002:a05:7301:2f95:b0:2be:1946:8579 with SMTP id 5a478bee46e88-2be4e05bca0mr561974eec.29.1772786870558;
        Fri, 06 Mar 2026 00:47:50 -0800 (PST)
X-Received: by 2002:a05:7301:2f95:b0:2be:1946:8579 with SMTP id
 5a478bee46e88-2be4e05bca0mr561960eec.29.1772786870005; Fri, 06 Mar 2026
 00:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-qcom-ice-fix-v4-0-0e65740a5dcc@oss.qualcomm.com> <20260302-qcom-ice-fix-v4-3-0e65740a5dcc@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-ice-fix-v4-3-0e65740a5dcc@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:17:38 +0530
X-Gm-Features: AaiRm53gfCr5M3RUQ0TNbe5SUyiCFNlNVgIigtSQ2TjqBnHklxctDwimKFYR3Hc
Message-ID: <CAGptzHN=uiYoDC-LwmWcGc=bO6gYWmnr6DNiS+o0M_BS80QftQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: ice: Return proper error codes from
 devm_of_qcom_ice_get() instead of NULL
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xsoBq4m6YBOJmFxI-hWUvIaaDM_wAdhg
X-Proofpoint-GUID: xsoBq4m6YBOJmFxI-hWUvIaaDM_wAdhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX4SGu/5Bc8fVL
 ZFYZA1LlXXhBS+RO/QQQoM1NooTtnQofkjI7A0i4hENGAHLgyDVSeWMoMWJhAQHe1nTI33YJWQI
 rB9gRc6Ic75kIfcyJElcFvBxNlGh7Kl2JXNhz5IZCSnn00w0gFquWCavXwvZ2cknDn8+t8xLKhh
 6ee+Tb2msII+JFsnvlBnXEEi2O3qzasxjoBlhWD0dk6R1sTpFL8ga9fOSAYoU3rwlv1raIVpSap
 0+UyHPgIKfgpDJy8UlnPobgGArZ+R/O4i0suorirct4f/yuRcO6He4Dbia93tHjtOqOTdEYYiBn
 RgLdi/y0GuqWATolklQS5QeTMnjaqJSYR1biAxtngtBFLYvcJkMeHmquijwnx6Wux1euEKN/94/
 GOeiXPVKOFjQccCpNgNZkmjgI7mNyPssOa2tXELJ4nV8RG+UoYQ8KxauGOZ4YUKDq2rsqMiLiOF
 lAnDwn/4ly1C0H5SNBA==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69aa94b7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9oxdx14C3Cyt1g6qQDsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: A902621D54A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hey Mani,

On Mon, Mar 2, 2026 at 6:30=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> devm_of_qcom_ice_get() currently returns NULL if ICE SCM is not available
> or "qcom,ice" property is not found in DT. But this confuses the clients
> since NULL doesn't convey the reason for failure. So return proper error
> codes instead of NULL.
>
> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/soc/qcom/ice.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 833d23dc7b06..d1efc676b63c 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -561,7 +561,7 @@ static struct qcom_ice *qcom_ice_create(struct device=
 *dev,
>
>         if (!qcom_scm_ice_available()) {
>                 dev_warn(dev, "ICE SCM interface not found\n");
> -               return NULL;
> +               return ERR_PTR(-EOPNOTSUPP);
>         }

With this patch-set on top of v7.0-rc2, I still see UFS probe failing
when ICE isn't supported with OP-TEE as follows:

[    5.401558] qcom-ice 1d88000.crypto: ICE SCM interface not found
[    5.419482] qcom-ice 1d88000.crypto: probe with driver qcom-ice
failed with error -95
<snip>
[   18.662977] ufshcd-qcom 1d84000.ufshc: freq-table-hz property not specif=
ied
[   18.670193] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable
to find vdd-hba-supply regulator, assuming enabled
[   18.737665] platform 1d84000.ufshc: deferred probe pending:
ufshcd-qcom: ufshcd_pltfrm_init() failed
[   18.747141] platform 3370000.codec: deferred probe pending:
platform: wait for supplier /soc@0/pinctrl@33c0000/dmic23-data-state

Maybe it's the "qcom-ice" driver failure leading to this deferred
probe problem again.

-Sumit

>
>         engine =3D devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> @@ -643,7 +643,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device=
 *dev)
>         struct device_node *node __free(device_node) =3D of_parse_phandle=
(dev->of_node,
>                                                                         "=
qcom,ice", 0);
>         if (!node)
> -               return NULL;
> +               return ERR_PTR(-ENODEV);
>
>         pdev =3D of_find_device_by_node(node);
>         if (!pdev) {
> @@ -696,8 +696,7 @@ static void devm_of_qcom_ice_put(struct device *dev, =
void *res)
>   * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will a=
lready
>   * be created and so this function will return that instead.
>   *
> - * Return: ICE pointer on success, NULL if there is no ICE data provided=
 by the
> - * consumer or ERR_PTR() on error.
> + * Return: ICE pointer on success, ERR_PTR() on error.
>   */
>  struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
>  {
> @@ -708,7 +707,7 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *=
dev)
>                 return ERR_PTR(-ENOMEM);
>
>         ice =3D of_qcom_ice_get(dev);
> -       if (!IS_ERR_OR_NULL(ice)) {
> +       if (!IS_ERR(ice)) {
>                 *dr =3D ice;
>                 devres_add(dev, dr);
>         } else {
>
> --
> 2.51.0
>
>

