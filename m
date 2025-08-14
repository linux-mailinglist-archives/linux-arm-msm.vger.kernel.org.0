Return-Path: <linux-arm-msm+bounces-69286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8EB26F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 21:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B143AE2C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 19:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DD71E7660;
	Thu, 14 Aug 2025 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RsVnq6D4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lITPL3jX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC3331986D;
	Thu, 14 Aug 2025 19:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755198043; cv=fail; b=Yl9ZxNLD6Rz6HrA/qwbmchPStzr00wVMRPdVEDQe35E7PN0H0f3njcD+5zflhTFO5rnMDYFvV8QZ0qH463jnv1uhRKA4RyqxQ6SWS9YQ/nlxU1S2Eb2ayO+3s6ATDiq9DzREUfgdSfAQEcj+/1gVXj3ZytUgWjhxIZ0vlboOums=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755198043; c=relaxed/simple;
	bh=9/Chg65qpia3sVizYEfztLLqJhscKqNKhFBbqBeCIWE=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=TtXSuoWjxt4DRoNWQXGXTRnP4tLHkHv7kLwVP9XIrOdVO6Q5E1M4WmGx56JkDFixnofFL6S6D1EL9PSONYecNHf0vCHJWDsDxGHkW7VKukxXK0yUM8MPD+tPxEmzatS2jZswfT6YmOMp5hQUkjQJOr8LRjoDEqOJOJ1vdWt2KOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RsVnq6D4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lITPL3jX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfsDW018462;
	Thu, 14 Aug 2025 19:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sAELIGoUo6FleYShez
	GeRD9YnEja/UIu2o9NH/FN04c=; b=RsVnq6D4GGE4B2oyfF1bl3ucytgREscxyw
	JdNMe7ESnhWFVhSdPKAelsYZQ6dCtljs4e3KU2htEAEXT9DrfLmmIgocKfjmjcqP
	njHR0noEkmDcuJo+LAhYCra8n3cjkNIYJdBwpjKbyKqmDY9l5wgzpGrXiRdM/CHf
	4cbHWdKMi/1TWp5SkxTVUjX6plD8M96QsYNXeK8enHFbWXcv92MPwMgCcwSYbzQg
	nvfIc2iQKJWgd8HExV/0sHS7xBGbr6WB3g4Ml/7DJKCIDgmtLiw9/yE4Nc4Fu82y
	/rGjl6VvVCqPyiN8JOkPlAJqggD7pd8AIZ3GvIftO/Jr11Gop2aw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchb6dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 19:00:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIr8rZ030166;
	Thu, 14 Aug 2025 19:00:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd4g7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 19:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoBwFBSgdZ/UhgLrULJ/8X3jFNl9FuwVOegyqFIysoZgmgKtHUEg3Qs8mI5GUT6k/cBeQSsPBLxPVGwntNUQVzQy0NiNW8ULhkPy1inr8VjGXvfxcrptuqII366BYJBBguRH8Q+VkMPRYJLZIIFSWhCVIqCu62BYXKmEuU1TaowJZU5aO7DHhTbgbj0QIPx+Zzx/nr73Mmp+nRmxJKn5DvgBFiXOD0b4EXbzuV85XJwa3r+lvFW9/3fimTyWgalKIYZjzUPch/2mgXQisF2ZGO+Be1Vb8ATV3/wO7QYBbN0NgTmMTvIZKumtgVMF7r82ZzCF0zBd9pzP+Ed/BoJUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAELIGoUo6FleYShezGeRD9YnEja/UIu2o9NH/FN04c=;
 b=XfMFODanEr2UNXzbk2TmH9p90p9wS7V5jJDuRK0Zul2dyqlHfINP9msU0HPG2bZvd1wv42kx/cCtnOHH7D1sCYl3++sdw3Md8d6sDms8CW9+RkGyj1E0OtTkbRT9L6UY+5aM9cM41CnpAxXHna7Ubem938oM4Xt6w5x2baRUsRZK78P+mBHk1KjiOdbsnY1va4nSzrtm4qdHUSCFOjDF6bjpQKju1kfTgK/i3954xbnd+TN6UvY0YVw5zJU9jkLR8nB/DAwcBTCN6oLwvOvpuQjPPA4gdeZ3vIXjPhZ3m7gzUF1Siekalf6U2ujHyzmx2dlK6F4u99FdZjWUJueunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAELIGoUo6FleYShezGeRD9YnEja/UIu2o9NH/FN04c=;
 b=lITPL3jX5klQeTfMurd/IUEZ09grGjNuofWkEqwXEp/qh5QEsvv6ZB05nexz6WkJVJaYWO6QnIOsdEdTfnbeNYkFo2Jl3uox9HNL/i70Y5nJ8OhrT7dtkjWuwe9kCMdqGiJjrC7BQM2ul/Vs89GD+JNv4Nl+4xvklZk5fBVuFTc=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DM3PPF334FD9217.namprd10.prod.outlook.com (2603:10b6:f:fc00::c19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 14 Aug
 2025 19:00:09 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:00:08 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ram Kumar
 Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: ufs: qcom: Split SC7180, SM8650 and
 similar into separate file
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <89cb937b-4ae7-4edd-be54-c4fb25e06826@linaro.org> (Krzysztof
	Kozlowski's message of "Thu, 14 Aug 2025 16:27:52 +0200")
Organization: Oracle Corporation
Message-ID: <yq1sehtrap4.fsf@ca-mkp.ca.oracle.com>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
	<yq1ms8d9nx2.fsf@ca-mkp.ca.oracle.com>
	<279fb589-d22c-47f8-9c71-4e959bce3800@linaro.org>
	<89cb937b-4ae7-4edd-be54-c4fb25e06826@linaro.org>
Date: Thu, 14 Aug 2025 15:00:05 -0400
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DM3PPF334FD9217:EE_
X-MS-Office365-Filtering-Correlation-Id: ae52fb62-922f-4f9a-f94c-08dddb64c96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?06oGmBPkNRy0W5vljwp32xsQPQ08l3TeFh5L56duhL/kIYrfAdixBoX/WDOj?=
 =?us-ascii?Q?+YsLA0VAMps1h8TmD6l/07WfladiQ7l/883KuN5kHQKGX3PoyIeip7e2p6RH?=
 =?us-ascii?Q?LH34HR1mqV4vmUrRDGYL7SE3bTGLJaN7CjwS6v04IoqS+xViwXYZZLmhkgYO?=
 =?us-ascii?Q?vS1fMTjV3pZ812YHq5xbEgDnQJ3OKf9HMsByfgTEHBsFxpk2MmVzOeeb0eLB?=
 =?us-ascii?Q?dl2URflRFgW6tvrhcnB9+XHe05UqmfLAGbwqtt7PV3QG9jZ7rNMNYboeTd2y?=
 =?us-ascii?Q?faaWrct8FbVDbuMt2lv5mP34K7KllXkyyuam0XcT+1fJ/JBSEoVUcRcakiE5?=
 =?us-ascii?Q?BivPu1DRdyZSbi6vyim+ud2Lder3DyDO0y2PvX6hSw7pq65jpjcGThAOlFne?=
 =?us-ascii?Q?7nC3ZjqI9qTHiotYsstNTdd9TMVtNvKhqShfKC1OR548FgaPOpI+/JyK+vaV?=
 =?us-ascii?Q?dZq2tqhZj7r5NtyJ2bA1vjrGVsfaoPGHnrjDTU8fgDMfGRlVv4FI3l1WqUa9?=
 =?us-ascii?Q?nq9eFwE2iHItqHGRiGwa2qDdg/GfMMWFLNSlgwfZ/3K7BMSu1v1Fwi6D+r4U?=
 =?us-ascii?Q?xI5cmTUpaQGESkle7x3hShlZU8fE9cvSRC2YUWi7C5+gZYR1z0oFhVj4T5Gu?=
 =?us-ascii?Q?AJ5R7EQqNCmsUDNuf+bDhduxCoqihoa+9+UXqqAQE2eAJSLrfRqnQNTofc/l?=
 =?us-ascii?Q?v57zkJGEPNPi/zROXpYAjACMWHUfnyNJkol+ZlcYt55Oq13b0al+6nFgc3PT?=
 =?us-ascii?Q?IMa1cYfLp9WTdL/xqXCtQTNr4n2zKlspTD/8u6zaLGONakhvqc8/z9lcu3Pi?=
 =?us-ascii?Q?Pvsqxzcyt2/oDT35p5CsP43WLazfpplLKKIVNJ4qpO3gS0EUAAMj5Fqe9/6u?=
 =?us-ascii?Q?C8cEmaqR/F4xlkouDAnxsCfw95RmsLOYT3T7N2CYOdjGzlNdIDd9lfSIrF7G?=
 =?us-ascii?Q?P1hTPWyN9x6iEa+xtKPINWnrq96HIP9uOeUqzWAaiyLMA9mLXxkKmCulkV27?=
 =?us-ascii?Q?EXGxu2KIOR26IN1tIfSZZt3A/uSPl698i2y9ka8hcngH7ojRqtrsroo4maz8?=
 =?us-ascii?Q?22UQwVigF9Jwsx1iaOz0+7ChZwuSgQyeFhpFxwkX7gluF+RZIDKego1uQmEJ?=
 =?us-ascii?Q?hM16faqEhLFJuwmOCIPaxWRv/o4JGmDOixgX1bpn64dPljR9fFBlZhPdSiCC?=
 =?us-ascii?Q?wBJmxkGzAzwFOD4fo4x3nQQDsPWWcrPVdttlDqUXFOEgSX8ZjrjjGQKwCZYP?=
 =?us-ascii?Q?jHEX7GtiqzmQVSjfPjUgZwNFePyL+Nm66qO4cByQVqRXDXaNx/1XP8gVAVuw?=
 =?us-ascii?Q?Lw7Dr4PwI+HwHs1WKBYD03gAuXg1aRZ06PX5mY6yUmCcE7zyxRmj5xaN6fUc?=
 =?us-ascii?Q?81/FDdMWFmKeewtKJEHyswuFkUVg7G9eOswTspdWtmCV/k0qKmZo8/apoYZ+?=
 =?us-ascii?Q?oPvSdQp1HuE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Gdt/pI9e8UCo0z1l/kC+ku6qyAApxPPUr5hkiGa5spyNteDE8+9lHrwKiMK?=
 =?us-ascii?Q?PYy2wx0kB18mQ1FydV62MttTS0BDjWgaTarcy9R/cl6Cyglpq5LgEFJjFPFH?=
 =?us-ascii?Q?w6V7vqkwHupnRI8G2q4TC7M+iVKEH9fN5iYS2S+erUaOQTl/OVpofIePYyF+?=
 =?us-ascii?Q?onLiUhOkPIFK3w72ycRJ5Gdy0nl7LSSS9xItbLWf46HPEsPdgq/XIFGxz7Jo?=
 =?us-ascii?Q?bP00iQ9VBElDN3SdaX/Fp7lKWDQRr9zGOnXIoInmvWuk1/447D0h+cmlQRgV?=
 =?us-ascii?Q?msis+pDb5a812D/MXX3LIvXa3dW6NwXXdfcIXyPz8vJzRhCSf18+8Fa7cwEH?=
 =?us-ascii?Q?iVfrdVjKHYl2A9BA/KrJ8uMdIMT7U8Psrrnqf5XTxJ/3nchyRrLM7hCV8Bkn?=
 =?us-ascii?Q?dCF6nUiGCaJUtCAfE3dJ5M3/Rm86+lZ9uisZOHvbmF+g3lhyngAET+0FPvj5?=
 =?us-ascii?Q?eDIsEDh5T1soxFHzm+2miauP12QX7DvaMb6lDnfhlKGGB6fBbr2uD1OWt3hK?=
 =?us-ascii?Q?vB03OdskjBa4GD5DTE7NjG509PYx4t+/EBjZfCSChvVzgdnVOLgIoGE5yaX/?=
 =?us-ascii?Q?oc+82R6x0s1ugz0i1w/qsMJPYTUtvsf6xoeqLk9IUJ1kf6PyzaJ3HRIDSWXo?=
 =?us-ascii?Q?dm7jZ1RFPbhAjn4zfdvrgg9S3sgPQaAOzfaPO50FZkZtmNZywFOJqaV11VZ4?=
 =?us-ascii?Q?v7oxoF7HMV1aKENYJGMQBA7Qhq0h39P1NbeWByqXtk1Exjtx9f3u6L12T7I1?=
 =?us-ascii?Q?n/EwZqi0og16hdKOIkhs97jRO45EZb2fsINL/VHQMhEluQ+oosmBqMeNBi5j?=
 =?us-ascii?Q?4eu/4F/2d0XsMCcROf+AMH3pTtVg/HhJFOqTO1dTLP0iCQUFlI+61CcCA45e?=
 =?us-ascii?Q?/eJnAM1+PbUzIxXeinxB5xkxg1qsZI56JsPi+Xlq7sLlFqYAoC2IL1t0BGHC?=
 =?us-ascii?Q?GydkNIJtbBdxPiRKDlIfTY8k7dA+3vvApgQOgUPPiO46ypzra1VMKI3PhNX4?=
 =?us-ascii?Q?e4fGrDxJPOc2d3/4VzgNxORfi+OExis7zpW+9WERY3RLk36Z6Wmv0fKEJ2+U?=
 =?us-ascii?Q?EQa7xQrhgBOilcmj8k9xM+NpRxrOOmZXUsgXiAcfaMN+DTeIJKJc/5P0WAD8?=
 =?us-ascii?Q?YEVf8Jn9A3lMX17RtXN+1TaD1htt7nwpypnWTDohrcB8I3EC7o5+RQYT3lX7?=
 =?us-ascii?Q?bngWchkroJkVYrdXETb716yXsAZmGZUV3gwQrlUnW9dbRHKO/1trmSOuAjhP?=
 =?us-ascii?Q?xyFB3QXlhPPStqXyAuJKym82+mau3lKd4uhPsvkgXsn88q2fEk0Q/p7Gq3ey?=
 =?us-ascii?Q?trgb++BQi3OSFnedAjhnIiGAe2gMJcKVGPuksdocxwvB/D9qLVRyueQJH/dw?=
 =?us-ascii?Q?XXRyVOhn7m6tt1JnfbFIdhwWDxpQK0TFY2I7xLFN8LLVqWJp/U7Gyt/psZ0j?=
 =?us-ascii?Q?nfSkscPd33AqeT1iDjeX++j6/jxbakXyf0Kgzq1UQk4w295V4Tc4P22CxtXR?=
 =?us-ascii?Q?ZvVLCOobbi9YX5tM0AmQKmOotr8qU/RSPJxfTCy/A/SDEVGlYCWpQLtgmhfO?=
 =?us-ascii?Q?wrpQMPoxEOeCbmtnzoYMlfK/CPOEfIs3PI6zdgCNF/3MExJC2p/jRjuqyvM/?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nqQVCZbHvQJmJ1S4zf+4YNmvV4b6rmLmh0Byswa2b7SIK23a0RXdoD/CTmYZdwNmy4B5wlwWUh2xhNYfaAEd0lpVru+jHWVmYa3wJf8pYMRr9GDEwN4H3ap/huQVCka4rhXHuvs23BJGt3iQ3SrppflS7fU7v5f4ilj9/+UjFw7hk8aQGxIUJkYBBorafsKNVcJOmxYgCC5xh4twXL3pxZXviEuHPopQeNI5nARAisC0ixoNXAOPbHMaxMqBno6XAiNFDw1SnpLG/WnL/7UmHIIw4BcJ+pR3mJJMilf221cT71dBNOjVSFkImQbsW3HWYcNZMlZV1L5Y7oP2x8jx8J/hYz9XhH4e9bkSNpIR6EZ8TG8cwCe60+s04QqqGVxkip8DQQiGFoyG+fo5SB2BMHmNWWwEYV9CcK9YN1gu/ORZYdPg/wyRxsisYF94GiHKxDjRjQ+3UrJEGrrePSgowBLdK+3UuNenTmXqxcXVjb2Gh+ZMFPCRHi8FtigTikcLeiPZTauP3xYOt58svO5OtzkEA0P45lGCwfWC+YWXRo/w+vlyr6tGkSv3iqiYPisdkymWcGayMqowbx5Zd9gsrWZFVGCUSq0i52HLmfvtcgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae52fb62-922f-4f9a-f94c-08dddb64c96d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:00:08.1781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqudKXQvOxyTSBGu97qlaPa8Ki9vwNi7y+qlHRwHwNWCAQ40lN+iB2JwpvbhY8cPElJjGJAeLw2cTXzo9s9pAp8lSAhDOis36siMJbHRBP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF334FD9217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=894
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140162
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e323d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=gEZOuG9UBQSb22PEzLIA:9
X-Proofpoint-ORIG-GUID: _6EoRfKqymWtPWltJXuoOBI5_JIYpPU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE2MiBTYWx0ZWRfX3VloHHsYFYy0
 O634eZbKMf4hNwuIfAD6Qurj1tMRcA3kELspflAh493lSGcNBVhFPrk5zDz3ElhqvWISBMFjhRE
 os58uftefPmWjwbYB3PlcvZDCWS9mPtcH1+ByrbYB7eMPzppVd6RMLM+63kJ0R4UqqTXdwLI4Lr
 GVzBOGDLg6QqYV0pStsAIFhcxT3AQszB2t8bkGVps1H9hzx0IXhY6Pi7wuJRaUuOka4s8EsEney
 xuY3sy1/9DGIDTVMtVmoc4+3aMb3U/0ngCGeeeoVlxZHGSj9nTaoPPrWHs6rZbN13fQ7BA4tieo
 0miwcboooo7xnmRmKhqUO+4N3pHLGEkMYXThHLgKSumoIg68TjFCRsGPsjJbMOJH9jmz+BSZ6/a
 xpGLL5YEFZ3fz4haADjvMXAxVGT694TspZt53Gdj6iUri6UI3UP8xtrNkkab4uCemejntsXR
X-Proofpoint-GUID: _6EoRfKqymWtPWltJXuoOBI5_JIYpPU-


Krzysztof,

> Did my answer reach you? Any questions about applying/merging?

I'm planning on merging the series later today.

-- 
Martin K. Petersen

