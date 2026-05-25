Return-Path: <linux-arm-msm+bounces-109592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAasOEIMFGr6JAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:45:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D235C7F9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8A133007894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066093E1CEB;
	Mon, 25 May 2026 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXvmyWvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Era4YHSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EB83A6B68
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698748; cv=none; b=MY9+sLkarJL4gzMAwQtx3Xmb8JAg8eD90gZcMDbSb9X2DHHyeDwYs15/zyBJdkzwpd+yETqmDFkq/zi5bJ/1d28AWAhVcnHv5mG8+E2Y6xJz8tLWpACRYw/hlqx+vThOBvMIbxqmukQkxiCBP13uEHZvz0rd1UBoAfkPbP0sB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698748; c=relaxed/simple;
	bh=eqUB+beeVwmV54p8GMWozUcJ8djAAGWZjc7y3WMmUk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5qCQ9jAJ1e2qDQFGg59PDL4UoBpCfJ6eBFprBEMRfu8lD8ISYVUsk8Hpzjryv7mNV7djdLArkoCPriyIIDcVF7yt34a8WIOwVE3V0PfdGNLqkVVVwOBzlf3IMVQfBUEbYFALdnq4790oioBUwZGFvRPmqoDUwuXPJ+1reKEXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXvmyWvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Era4YHSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P81h2g1707573
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUMbg6cDpe8XLBpHj57dSo1q
	TWRy4Xqw6/CpTC9UXPE=; b=UXvmyWvmt81bxpC3mmtVfd/pAqTjpQeDifowuZTP
	qDx/S+XeFBPKVw97IU3D05wQCd/TlnpWUiB3yDxdbJjhO6QVD2QAVdzuEdpA1hZy
	LV1NICTC/qKZMkejOx7C/pveMXc0qyrkGMuuOpfF8CpNDPGllPnQTeLuUq543Ur0
	LrOMQlV71aycQWRVtfwSEAxogQfEdkkIa9Dpqonc8o22qYtnedfcSm9glZ2HasN0
	qsDG8Te4h8W5iRDZVfEtzRCxoaUqcEQCJFe/J5J9XDlvQnYDTxvN4OzHFnLRuSkX
	ntnT0gcXbyUrxX1onwDaYkkws6XHESfocjA67/h+3usInQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txnupp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:45:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d09e77e6so72682471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698746; x=1780303546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUMbg6cDpe8XLBpHj57dSo1qTWRy4Xqw6/CpTC9UXPE=;
        b=Era4YHSPpVRmT7+wwgqi3bGY+GZs+42P0W7HudoALijg8IQF9tE2X7TlYe4lNRy9Vn
         P+OshjhM7d77aLuJNAL6bPlLwTV2xg4mAbSEBzf+ppekYBHcK/Qusptq9b4TjlnCC7yn
         nKI7Ft5iCrnMl3hNUVEpXOEbcw9rM72hRxAJheRO6RrMboZMIkkohS90PVVDMDyzAsWE
         lP1A9NS1edT1KZY0W2yqry9UiUUXWP1QAlAf1VBuV1ePBVygqPDgWtTc3C6kKPQ/8D4b
         Hhgj81Fp+UaNH1Kq9AdOl8QXv6BFZmYe9qUATLIwYEo7R6lZGKxfWa5DTB8Ur2Ki5M8K
         SVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698746; x=1780303546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUMbg6cDpe8XLBpHj57dSo1qTWRy4Xqw6/CpTC9UXPE=;
        b=fMJAg13IaW7mjsaIYCI5NtdylikKAanRBliMyFk9/3t4H1ITiNlC+AHF2ec2AWfnIr
         Rr+72kzZvMNRmb1KJ8QquMeAuin5B9T0mjmnCrGZbhtHpRpQVEjrUBom6vVGrK3jCYtG
         X/2FsqhFxn6rww2FCKKpFAOCG8lZQH7GXg42QjcW77gCZCa2nBdkSiok5HiDdLc5UAWB
         Ej2f9nmgNyE9yDBqPGFWZMHYdG9UeOEPckMM5RVgehlGlfTRWwelc3Vjf7/TswWtD1UA
         rJbmUHjUINZ7Q3gEXIjTcNYw0bBS6OBt8si7EtRCdxPjI8B5mclPwoLQD6KJvty2UoOB
         WF6g==
X-Forwarded-Encrypted: i=1; AFNElJ+Da4e2hwtRUBQ3O0xUHKbv65H5lV9aeaHoC9Yt/FHsvTelfVGDOZ0YsnaP0mUuubpXT/0PGwiyryONaIvt@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIcQkoSJU8/5QePtu8f5O5zCJ2ZIF3TEFEv8b6ewGvFvCntuI
	868o+J5loSq7phimQqmtOXgWea6MnZ02fvhuPBWMYSQyTuq9ui2REc/rmZZ2BB/r8iMdhGB9fn0
	Ypk9ZKL5xTaHo9A0kA6/OPNCBp3mWdTyYZRlwiFp7/Pm5ZytePNYn6JTVfLGT2NFNcxwH
X-Gm-Gg: Acq92OHu8c3W5qQTa2dcl3Z/hQfTMmlhyP8i+P8+ykiKkHEQpVNdnqD86i36j8rk43D
	Ar6lwkwiNA50teD1NuNvbnjbvhOdSJYgMI+x0W+EQjZd6hKFXrC76ssEJj4auK/iVnjlgng4qWA
	7JZEicj0W6VmBibyIMWbTxsIx34oCkhB0YSWvb5GiqHJLEv1Lf+csHal9sLiTCWl7lADAlkRjp9
	R/qu8vdShgNUuVhlBgczLHj3P/hPS5GoXKN0Ozxznx8xsHov5vme7JPFTUw0axd5hyEx8l9TUh2
	bOACZFsrhCLGWaFf9AKfASfUdY//gt5cqJt3U0t5jZ4dqlM9j4fsqNbauk6Y/a759vEX/Nf8+NV
	gdI9ohc0zRqtOW2SVplhuiIU0+S+ux9Nm80m0rZerSSN6dU8NxTHMLltL8ruXJLorP9RbggUHbe
	n/R8Vt7Wvpi/lmJQ1Ud0d7VwaoAuGwrdoPW+Y=
X-Received: by 2002:ac8:5889:0:b0:516:d60f:6438 with SMTP id d75a77b69052e-516d60f72demr185991121cf.0.1779698745954;
        Mon, 25 May 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:516:d60f:6438 with SMTP id d75a77b69052e-516d60f72demr185990851cf.0.1779698745535;
        Mon, 25 May 2026 01:45:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc43aabsm21943531fa.37.2026.05.25.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:45:43 -0700 (PDT)
Date: Mon, 25 May 2026 11:45:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Message-ID: <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OCBTYWx0ZWRfX0mAdpAs3CPeG
 oP36cmLH2MfCDM7W/UUGwBvv8NBTq9u46yHJjQx1YJb33gWWbGuKMKwAuWHgE/4T2tMmVZHSSZY
 pwh77he9vtAqIktMh7u+sFTtKMNjWtN60aqyaYAtzbxeiyrsMCXLkxXioSV7Q8QoAdoHmT/mTAI
 7J8V+9LxkrSTemboPvRWxoGmt5HhXFYTCih5mz2lkx1PY857QmohxYd0WH2fcQhkBvyeKavzdOG
 2FZPGAAz/gJs8Hi7PUIHBj/DyC+AxvlLXvSvwAOdrJMIGnsLcgC3JyBizCbEqtMMwroQTtY/icz
 N9p870JkI/J0fNbMXs+rx8BjyoAzJwgyriGL12U600PjMI2PkiWanm0/ITvYHUSuZ6zR19ztHW4
 uJx/+4B3wvk4s8nJuPj78Zbks1fAikl2Yu3eMxJc+hHNkuGlMeaq6Eg5/LcaPuior2ltmOiXwEh
 YKcjfonqmr16+yRT8vA==
X-Proofpoint-GUID: ekWf6D9Ry85b9PMS9a_TYT128W4dgBQ4
X-Proofpoint-ORIG-GUID: ekWf6D9Ry85b9PMS9a_TYT128W4dgBQ4
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a140c3a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9mNwicV8TSN3JMHTN9sA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250088
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109592-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86D235C7F9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:57:16PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Add the init sequence tables and config for the UFS QMP phy found in
> the Hawi SoC.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
> 
> @@ -1306,6 +1315,12 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>  };
>  
> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
> +

Stray empty line

> +};
> +
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>  	.serdes		= 0,
>  	.pcs		= 0xc00,

-- 
With best wishes
Dmitry

