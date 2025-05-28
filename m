Return-Path: <linux-arm-msm+bounces-59643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3790BAC5F24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 04:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE25189F712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 02:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E6441C72;
	Wed, 28 May 2025 02:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QbyclBA/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wl8x9giM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F241311AC;
	Wed, 28 May 2025 02:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748398566; cv=fail; b=IIJBe2cn4jP2FspDufHkhIydzTr7Qs1lv91gI5m8zFuQwLd8KsGhGBTVuXQeKrbH46ntkFelR0VzOxd8B0pzoWh9hwivXHnJezTX2esljsALRndqjN9SS+TPPJL3bMdG65h0NT6688eQ+SSC/juql9rG9t30xbIT4NEr01s5sYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748398566; c=relaxed/simple;
	bh=o9fdiKI5LnwJLE+HzBjli5bF2TT+QRyeET816GAeoSg=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=MMJyE5ePHlxY29WDFLJpc2n1MzPQCROGXZq7/BPBXp5h07Xe9HvZOGkW8IMRQezSfSjuiT2x/w9yrQ+Jpj4uVJ1roQP4tOvKS8/EI6AvIfD0a/Jm5bxewGghe6aQHbrw7vqXZMq9NVmWsgzk9fyliuXUShmf7hLBhD2v0VTqOU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QbyclBA/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wl8x9giM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1fxMC010087;
	Wed, 28 May 2025 02:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eJ3whbyXIgs99rYWKw
	wZiXSXmdOeZ+MFnpcYiK0seAA=; b=QbyclBA/hl+IEzp21k4QMByOe+6DssdkWi
	jZp7aoEKUXXNd5QaKES9lSDdFHPdTfZeNWAjvr7zKGIfoqeTQ8XdegvKglZtdA3h
	fDCt4NdBpfurFWUAyXpMoERuypN+9LIvQZ4xBnV6qFgqJifmWzS6+2vNwn3hRlci
	JD5hUjXYHmVniaedLNIUbR9VoVv4E8LjHacJdzk5/sVbFpngLohN0U5dVlotC6CQ
	d7yndJ+3LsWN3JSgeRXudDFP7M1ykB+eTRkKVQp7kdpO8l+LGRy4cu5DWnZlssaq
	vxotpwVHWKombg3pyZAG7UO2gt88dIsP3Krt0g8TkP+j1uUjd2Sw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd4q94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:15:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1Y6vj028389;
	Wed, 28 May 2025 02:15:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j9ummg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 02:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sl4kbK5cif03hPOw0blRU+RgTafN+pKyV5zDCL9uHUdxp5OUvaP8rpB0XATmGB37BNgQLBf7NgXasC3pGF1dS70HKdVNCXa67Og2FeisxjQm458jnNpy1jv9Jb/vJ8wSLGEqU6rV6CoB+iTmtiPOzSdsZvfxaRah83egme+9saoo3zS6hf0sWBysZlSkyh28OXP18BduFRX55o/B3G2epMpVfXsfZDV1o4y7haW9pTnMlP1LXB3UkLfMpQrhcvNiTa+Pte0unKuW3bDxXcW46j3HMh8SdIU3UrA4TuCCnEaEzN7GCP9AitlDeE8sqJVNiNgVOxsRlo6E28Nprd2xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ3whbyXIgs99rYWKwwZiXSXmdOeZ+MFnpcYiK0seAA=;
 b=uhW/c++y3lXyMM73+BnaJPznxh0BB+bNPUZol0FXSnt6hjvFmtInqYKpG+yBzAm5evUeSdrNCORQC+GFEqfdqBs5nsGXRMj3PyRTq1I9eZM2YmoiA2ImoLDJvfcfLAJ/TD4dy37BaaiSOrFdEP2aEJpeal4GZ7PYy6ZOAo9rrK//P9KKYUfi35lN0VeqqUBuaDC6dG8G08LoW3cA+cENBbAzqhSDpJBSGICPlk30snd/Ju8kFuKEYOzevKyRDvaTNXB2ImSVCnhUHXtRit7S3pCnwfqLWP0Ekd8SaKFKaEIpMrkGDRaqhkTqQBRe0V8zESFxuhXzBOgO72IdZ9XSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ3whbyXIgs99rYWKwwZiXSXmdOeZ+MFnpcYiK0seAA=;
 b=wl8x9giMAPSUzZ6eRXWXl0a6TCtuKd73nU9SCBLDeLCmzGuU3mGY070AnFW2LYRIIQhnsxYuKGxmCquK1nPaVR2pFvikKCH1r7vhjsxXFswDnnvte4YfPz0CBJbGUQgStqed09k1sdlGEIjRk5rNj+RkPp1ddsRY69zpCoDx80w=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7610.namprd10.prod.outlook.com (2603:10b6:610:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 28 May
 2025 02:15:36 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 02:15:36 +0000
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com,
        konrad.dybcio@oss.qualcomm.com, peter.wang@mediatek.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?utf-8?Q?L?=
 =?utf-8?Q?o=C3=AFc?= Minier
 <loic.minier@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] Bug fixes for UFS multi-frequency scaling on
 Qcom platform
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250522021537.999107-1-quic_ziqichen@quicinc.com> (Ziqi Chen's
	message of "Thu, 22 May 2025 10:15:34 +0800")
Organization: Oracle Corporation
Message-ID: <yq14ix5iipw.fsf@ca-mkp.ca.oracle.com>
References: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
Date: Tue, 27 May 2025 22:15:35 -0400
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:208:329::22) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 0262475b-993e-4ac2-7ba7-08dd9d8d88aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xoU3qCvHQ1Ds/87HTcEZz1NZLZgjZyh1G+TEpLvhQMS0z9FgQGYlO2fF87rY?=
 =?us-ascii?Q?4eIWfBOUAvWNfGENlV1NZZSIsCnyPcug/cggam0WMJrQ/jSKNsNSidg/4Fq+?=
 =?us-ascii?Q?/46qrSeCINdtto6UcGKc4sq1/2EDr/pgoFbrCDDHGDYr2mtTPdve1Wct7cBE?=
 =?us-ascii?Q?3XA9DrF3A8RZUSY7TofbTWIiPSnN1mu5Q+Ft3SklXnVnLsVFjqYsCEsT/ZGI?=
 =?us-ascii?Q?XZpKLU2VuITo/5Mm7nGMhgUaNDCdG6OJl3OMnodQX5Ij9FitXUsE6TSaZKtU?=
 =?us-ascii?Q?jSh6QLMbMU9RDxECWi5J395kIrfedm8nbeL/SBFIbCyAIq2BoCwaT354R+1D?=
 =?us-ascii?Q?JeoGD40A9BBjyTAt/VZYfadusf9SNP8iCtWo2+UDYrIO73quL3BO4N4KSMsJ?=
 =?us-ascii?Q?CeULClMog86GXE4rx3qtaZqFh9hcDvAfaZqo9BzkDt38BWJB07uO4qaVj1TF?=
 =?us-ascii?Q?3VfIf7+UfVQp1E1ClTCb7TvjhL1yroDAJjONtkNgXglPf0jmz3PsO5Yee/Ik?=
 =?us-ascii?Q?jkqATeW8ICdRwOxOo44HgTxsDjvbO1k4L82SmpO6/Fs0cmcGx9LYKvxtKj4V?=
 =?us-ascii?Q?BPzcAW1f7+FYkqCjvJe0ovL6/MBdblwZUsW4zIQHB7OucxgeroswPzwZD9yM?=
 =?us-ascii?Q?Hs/J8+uFjTD8Da/WON8zyrPS7lvXj9wK4X4ccb+Hg1Cam6Oa7dAhDZCC+nGw?=
 =?us-ascii?Q?m+3W4OpyMYliI5Xs5zzBTGUERuBV9fZKgroqlEFisXAX9nfvoSnE0N6YxK6i?=
 =?us-ascii?Q?I4ar1PZuUTH1m9uCFJZZL74B/U0FKT6Md8dCB9t86T/MyYNCLX3vtHUi62PF?=
 =?us-ascii?Q?Qm7uGx9I14BfHG1wei6V41EffDNSBmw4VojSf7CiaHbKgIwJx5W+CoQRCM6A?=
 =?us-ascii?Q?IhKtVYvDVjoV6f3B4w3QNyuhSvPoEmUGK3GoHbVt6+9mZZaYluZsXdKOFt9f?=
 =?us-ascii?Q?ohSjMFRgS4ExBOhX/+bHTu+yinKdF/oH+yNIeQopTjEUzJCzKWIdqYkjMyQL?=
 =?us-ascii?Q?H0WeSCLaBtyot/pJukrXtuuAmFaRfGE4gyWAGUm3b5/dK0A44KhsxVSES9qs?=
 =?us-ascii?Q?ztOasxCD7L4D8c1M2ZhDZmOyleg67ywLSP/VJDMVZWgjNPpwHbE0oAyL6vAy?=
 =?us-ascii?Q?uswQOxKXydTjn6T5NNnAgChaHf9kQ7ybD7FZrQDCPOw+mT8rXPswjaAtMyWs?=
 =?us-ascii?Q?AtsMG2dZCWOArHhqJcqzg7XaahPzxHN9/tGfSVXsiCXBEchjC3TAhGdfTYZC?=
 =?us-ascii?Q?Ex3Rn0hnjrpNsZHsxmIg63JNpuPe90wiOFJnwRicydwrUs7mYeQlJzeEnHR1?=
 =?us-ascii?Q?syrejfsjxP7gV6yNnYaqUk0p7Oy3V6t2i3kVDzga9iX8eRAIMbQO6xwbR9v7?=
 =?us-ascii?Q?KmAlCnAEKOsUNlEc40HOypCASy0jgRMFRdKKRtqV8JJpxcz8De1Kk+U9b71P?=
 =?us-ascii?Q?kDYeZjMHrzQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KalPsm8xsl2CPRGfK381kXNCNZbsFQinYcznFSZZIQtrOpoBWtN9BD2d4wPD?=
 =?us-ascii?Q?uFaGNr+zlGcLks6Hnv8lmPx4xAiPDcVlhSF2S2axA9J/OzItPjWIiylavAVv?=
 =?us-ascii?Q?uwvgw3GIEpeOaAMA6bWAgUJwkc6CpUYyzkoIHM7hvxRipXGCQZIzPz608BHB?=
 =?us-ascii?Q?i8tvxTh6OnghJGcsAQBMwCgAXpUvNt4wCIOdJBl5/5/bbaaZuntUFgOguxBx?=
 =?us-ascii?Q?sjjlZqjc6QjWKB9ktiUmNoBgKWp5N84fPkFEWnq8rFZAD05a4BrIg2Xgl0QX?=
 =?us-ascii?Q?By9wisNWsSV99Rvx6Q5JZS220qKeXYtb4WPhKCecAWqghb3cJ2mzLKj+DR2G?=
 =?us-ascii?Q?tNwk2YHMXJ7eQj3XeqVsTiSqTjLYJEdPixt/0OGP/V0hmmD/rCAJoKAXo04z?=
 =?us-ascii?Q?gAov3o3DsaGR+bPykOcXbbfVjZykbfy0Xht3Nz5qYNWvXb0n8x+lnIFmYKS4?=
 =?us-ascii?Q?WVP9ZsXExXucZlv5Rb+WDU2dIUxldPN/ycWUe3BdwFzyRWUcLsQZt5kKbeg6?=
 =?us-ascii?Q?i3hI7EOyrXJ8Nm9FIyO3FMcX70pZ1euCWffn27xrC0nWxdxTfSA8k07i57wU?=
 =?us-ascii?Q?BdI8ciN3yayfNiIMhgtXQSrgs/50XjLUJWIVzbivZc/QBaPoohPUmBRMO5aE?=
 =?us-ascii?Q?d8npTY0NrSC82UxRckoGUtYBR92FT5868+Z93mo+erxeTf+vN+0Yz0kLC/GM?=
 =?us-ascii?Q?Cz65sWKdq4bzdTzVIrIplqYvYTx1u5/nqcB6WyFp+L9v+arXONKs8s2tvcOI?=
 =?us-ascii?Q?jakfGr83k9HJQJOexZRSmo9JfvaIDH1mrFOUq9QWztm7mRAQc6EyXj3h8LD3?=
 =?us-ascii?Q?01AqZRN1G+RMJPSdoTKBfDbtoNhFKjQQbS0XHMOVb+pFMpY92NsJZWF9wFD+?=
 =?us-ascii?Q?9TYe5dxgPIDiSHwNXaVt0+Sl9utX0m3STK1mCgar4sqactJ1ACGTeIrZw0wZ?=
 =?us-ascii?Q?QwBmZ5mGxJmscoas7AXplrhcB+qsyUxdA6TAc+rH/LEdysYCmzRZq+VI93Fi?=
 =?us-ascii?Q?CyQjm6OlVouA72p6LGy6dwUjkimhfMDYWQ/TcB5PPCX/L70aK8BS9zC5Y4ns?=
 =?us-ascii?Q?P2hmm0TWKIrVTshQYL54otluKWQvkQOep5OHL0BKV9KXt4LaLUt0BHEK8bsg?=
 =?us-ascii?Q?SQJ6W2T0rNoQD7tyR1YD5EZLz2XNxmjCYWGt5Xf+BR8F4MODdt8FAHntMbdz?=
 =?us-ascii?Q?J6zP5P5uzJBjEcMue3+X3bgzmWta9TVyPQdf47EFL4dCcobBwLDkra/xi3k4?=
 =?us-ascii?Q?oM3BDqh4c9nYm83q64m/M5E8Pep+gD7Gm1Q3cNDnxhyi8hAy1X/Vh0IqQuN9?=
 =?us-ascii?Q?VDKBM4MN7sfmYbn8wIpUlwbJYVGfaCbOX7fLKGZACopdJC060Sa1miW0NcHw?=
 =?us-ascii?Q?Z8K1kd0Wp9pThokargxeiNpXPapdnI7qS9QqLFASe+uhbNVOCW+eUDiaEyfn?=
 =?us-ascii?Q?B+q0v4rc2euwj1dTM4Qc3MmttGho3YrHKyPEPmpXP8h4cYblPw3L7FMg8ULI?=
 =?us-ascii?Q?20F0hvNUVAH3XMtvQBUYubnjGsh5QvjUgMAuAJLug0Bk19I5YTse7lFq8CwU?=
 =?us-ascii?Q?U85BqNG26pirFa63WgRJwXpQNvtLVZE0XtWpfTGHRiTdfssTXWcb2iDZmrfY?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dcNrbq2sTiOuTz7Ju8NsVJMGYXq3Ao0JAXIkuMKlawW8A6H3Zs/MouKx7vu2K7hheStVNHmuhJy8wR6kUB05HaesaeWWgmRcjTqjJfIuKobDt71Y+8B4uGbGlWcPUfwhOpcjL2skLhsf6w3iYPWedxi+vDJ4HoIkJhWbQtMTh99n42GHL6pxbRDoPibR/iI6JtEc8N4CnE2n5wkZMcJweaj36eqv5ZM/c7dg1oA0n4FaDOiFwjLMEQgbT4/ovjOqZj0zI3WuAwVzN2Pt/lhc+JpMc51Xiqb91IfcQwE8Wgt2rOT5WZrSbb0k8uMVQXRZrb6gGNRD/dwjvW0ibPa1URnCWRPx+tx7Ypevp55BYMRj6V/J8iKfAolR6PEMYwyTv82EKzGBVSfBHgc29DEfjYwR1kiKkCc9DggaX1q4+Cp37jsN/r1dxoJanYSmXiNFl05VvCwJic3BuarXgTIJ/E2Dsvknai78yQhy/r4/3bWmzbnq3hQi0BCv+4OQ3Cal+uZewgva3SEJtkOHzti70avYf7M1LSwrDPrugzO+SpcEf6u5a+0jsANs/sKKrICfFxt8UfGjOkGhpcvyEH+musQoh3gF4EAGMaICpqKxCfk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0262475b-993e-4ac2-7ba7-08dd9d8d88aa
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 02:15:36.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMpV9UGWynTIy2GCUC+Sudf0Oy3UmSiCw3KAVZRAIPznNTBv89OjpIYR0hq82BlLcZzabsDC5PVZ/d645cnw7jKc6uPaADVPtCP/E5f6fEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7610
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=918
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280018
X-Proofpoint-ORIG-GUID: UFvUsRqy9lMTRx8ym2x-Pn2zALpPyLwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDAxOSBTYWx0ZWRfXyuOWuWMN/sNn TdIiBxx2GXwugIfLBAx+vCbTHww0mS1p06ZhA3tlLdYACmb3urvEqM9qEg9ZtpAl2kFS7kvqBrX KLs9jAdsXUReUxSavG6Ww91RI8VwuSbIYPpRhul9eXt4+U8tCK03oJiUJeDPXWt1puyBEe5xnG7
 xSYjuE4yyz5Jychh0R8Lr8ERSu467A2SdF/qOwJp5xy7uIWGqMHl6XbLDQ8wrZObUItWZo6GmmV l4LgVTE9CkpmjfBy38WcADChVQd04fGW6oEVniGWf1EeD1Yl6sMnMa/nE8pJ+/2zfIWvH5HxIGQ MLms+sV9GZkGYHdYrDIurh1ax3zM0y5kEMV5TsMfctISW+CBXdwWfblAqwPBkdmurBwGSRFT6kB
 fiwyK4tnorwsF6KAJ16qrUv9V84ODodPF71Ux4uOXVtHib0EOhVZF8/Q5/kc3bo5KLPk1YQi
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=683671cb cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=q32mctcrirO_PcNCel4A:9
X-Proofpoint-GUID: UFvUsRqy9lMTRx8ym2x-Pn2zALpPyLwX


Ziqi,

> This series fixes a few corner cases introduced by multi-frequency
> scaling feature on some old Qcom platforms design.

Applied to 6.16/scsi-staging, thanks!

-- 
Martin K. Petersen

