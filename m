Return-Path: <linux-arm-msm+bounces-67829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630DB1BED1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 04:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6CBA188BDC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161F81C54A9;
	Wed,  6 Aug 2025 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CCrXnNSt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GWoA9IQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9321F92E;
	Wed,  6 Aug 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754447843; cv=fail; b=hVGCUqqCDbRaEvXjXoNIKIONhPeGiHgBnEHycUrALVSV0jKveqezvy7gUO9igNBDhBb17dytsKH7VMWdcFM3e4nsw71GZkmlzNvfpEATPQ0MbRejtgT/UHO/7ZvI874szXllbF1rwH43r75dD8cMYI+xZJ73+b/S2/64COdwZ2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754447843; c=relaxed/simple;
	bh=f4R50JEhsanYj6dict7NjejA5hxi8cu0zfLRvngx11I=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=A56UmluV0TJW+c5NdHSnm7pbnQpIkMIKv8a5mSMJdBWGllKYdfbhST8ZmNlZ3OpR7WWeoVW0Bn1mfQmOHIYQz/3R1pb5k/9O76XmsaoP3u5XFA+8YtnDYrdskrallBbbBjKSqc8AuOqsoKsXI8FyZTAzV3XnuTXFrnlaLx42JV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CCrXnNSt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GWoA9IQB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761uiZJ027470;
	Wed, 6 Aug 2025 02:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+L+xhAaj0r/f28f4HX
	Ys+11DVAwYk9OfznmgCpVKCAk=; b=CCrXnNSto3KCAdZg8JBk9pMey9giL2bNYm
	dS2LC/3F7BBKS0TnjfT0y7cEZ5Nsf5PmMWdQLXJyQd6p0KLsmeduetr/a6DknL5R
	HJCqHoAOlFZZZ2kBMP6bufbKgfk5piBESAC/4Y+7S5sLYwRsmm85SwenSvOKMWF7
	sAB2ioFJE+ZxkZrkQFreBAijLk8vFjGWTjA7exobQq/dgWhyQ1UpSSoMuLxCVVJs
	PWoGhdUTSpbRbbRNN4jV6IVd+prGloBhWcAUCP24KsBBlLlsZ0ySivrgeTfcqnbj
	k0Xntp22GtHfsQ2ciHdArNaNQuvoZ7QWFvT2tElalD7ve0nguePA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd0mkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 02:37:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575NRUAw018341;
	Wed, 6 Aug 2025 02:37:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwqe6h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Aug 2025 02:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDoIxp5weVY/kx4pAkyyUfySsJ10B6zGu/xUSe8cCW2VkSB0l7VI5dI/sdGAFBq0nyRBaKaMEUDK5naS8fJmpc5zZw31vwBuNIDOxel9nOfY6OBn+1bQ2CWj3f4W1sRFVI6wtiidzbMJxu829qi5YsqLZa1w02bN0CMu6apZ8iUr16ZuTP6kpM7eHdNqPGMOLHtX4SMy7rHxsNtepCZJ4eEeSHRHW3b/5qPntL1Ps9jEP8zRFB6iqw6bOQfQUIIp7wMI1fj7NAkawGqaoflJY+xY4cA3ZhX2NNXJ0SBULUXOKxmIThUj9t7OydHx6ZJWKlZ5TbH44FQwZ72X4+IRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L+xhAaj0r/f28f4HXYs+11DVAwYk9OfznmgCpVKCAk=;
 b=jStmXeTotxBylmTtHaOZsBx39ZoegoEcmUg7oSQwE7313qt2C60PmBjGfTFcOZaGEdubZ9jGdrELTE1RQFuyP1WNpFPD9Pt+2c5JUcx5zZbKiruO38AUj20INPa1w7Tj0goHlrGos+e97iI+dxav9/PfayNuHWgDuKHyAZNZ+yiu5GsTFlwch+fv71RcYrwolDZcf0fTQVVwqNJ/1ckfGxmLKq8wWb56DRKPx+4MR2bn2sDzBTD6xa3mww4XNeodX7N2S1BtTp/+Le/bGHFDnZ8VzV19Ov3/PQNI9TzYNqoQyjQuqviTPMoKg1Qdr4t/Bebf5qfjh28E1E2iVI4Pig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L+xhAaj0r/f28f4HXYs+11DVAwYk9OfznmgCpVKCAk=;
 b=GWoA9IQBFp1j2FEJSJ82USmu2U7NqpFkKyT+LPSjodGo4UrI4GiigQxnwafhQ+cWEa2WOP25ohmGM78Ad0FrzeLgN3G+euzqr0AhYZdbfrsqIcvARpsvlbFJf+DUyPbSWeEm0jNE1aRDtlNcq4u5IKj17YhUAfW6+3SYqItmHCU=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by SN4PR10MB5605.namprd10.prod.outlook.com (2603:10b6:806:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 02:37:04 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 02:37:04 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ram Kumar
 Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: ufs: qcom: Split SC7180, SM8650 and
 similar into separate file
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
	(Krzysztof Kozlowski's message of "Thu, 31 Jul 2025 09:15:51 +0200")
Organization: Oracle Corporation
Message-ID: <yq1ms8d9nx2.fsf@ca-mkp.ca.oracle.com>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
Date: Tue, 05 Aug 2025 22:37:02 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0112.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::33) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|SN4PR10MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d59efff-9147-498b-50f5-08ddd492214c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MfYV0Ikjxfn/WDuPqrfV/gvpfPKfVx/HMqJYwRXw5xMCC6V9W8Afw/QVtqsh?=
 =?us-ascii?Q?M59yndOi54gBZzhcdhiIo/vLI+emup8oaufPzaLxUfJy6RxWtBFnooC50QqV?=
 =?us-ascii?Q?ayUm2IBe6kwNkppJsW8IYa/94A0CyqoG/QyZ9i9HJPF2/4Y2odni2w/U3v+K?=
 =?us-ascii?Q?LlcdeBW6srTuJmYubF8SaiFm5N2C9bqRXzFcZkJZhUAmGYZq9xekfVuJExlx?=
 =?us-ascii?Q?cIC8YIBM0z+Mq6L6o1Mth+ag4x9pIvan+2MYgsHDLixsIYCE0PDlYSinEbCH?=
 =?us-ascii?Q?eQySEHSLH3tLOu6YMlz+zJ3KFWPWI/SNCZgj2HY5PgC1QTGtac6sdyfNd4BV?=
 =?us-ascii?Q?AXxi3AC+vjK0PV3q1uP1welOGGmn+FFGb5MbFyY4Mt9oBK+LQQCVagMxj23M?=
 =?us-ascii?Q?nlSnUxlphWUq85pSRTGoEjAhOcjU5BBFc+wioJ/CDZjvT1uqgInSTPZH+Zbn?=
 =?us-ascii?Q?PI0NZsB0aV0vC6lPeg6f403SOeKvPbeJPGmZ48AsdlgSWaWqMw6iud0gZN47?=
 =?us-ascii?Q?mXJMVoEYvIXEUoSQ9XC3cQxPAnla0w5JWN7Q9liRocwCbEAthmJbsQdHtXW8?=
 =?us-ascii?Q?hOukfKgEdEt1PlazzaLIN/TgzuBDVYdWWbFdsKc0x0fXsdRkMXmIzXAbpjx0?=
 =?us-ascii?Q?SCfX3txxiD6wXRphW0pGRGc/zhnaWHbbju9eqq/hnN0zHnyLzED7aQKKOUfN?=
 =?us-ascii?Q?WALO6xamroVbKtrZtHvuAX/rFRyqaUu2AOEQ7rUQn5ZTynkkJj1okDt2ROCN?=
 =?us-ascii?Q?cEUuGRn2HWaytcXI8tXkR58FO99kH4ef4c5ySfeTJlEF4kijD/XJRlZZ3I66?=
 =?us-ascii?Q?9pxQEZsKfodWqX28ulADEIN9bCJVKDtcYW72XTxvUGKg68jHxdMgE9+gKTFj?=
 =?us-ascii?Q?6EwtmGDKsXfEdOXL5bCUj24jw0IoFWl2tVr/MKxh0e+bGFHrizQwE5Uh9QKD?=
 =?us-ascii?Q?s+buTG5O/NQotluUFtD9G5W3l+gw0fZoCrOpYGl1nO7JgSElxF2C9Q5vOKSy?=
 =?us-ascii?Q?4taQua1efWOzReGVSHhWAHaXk5vCLv/K5gnQM2t9PTsgi21Q1hNAI4Dzf06r?=
 =?us-ascii?Q?dzSg9Gz2YWrp6N9PmWwZNgLkHrj6RIMziTylyQHAQ4uJfSH60ctzRg9pZtrE?=
 =?us-ascii?Q?1psqEnV0tA99kxAHGdEmeXv4bX5/nmeJl+ooMZD+E1mivjB4L8sMkGY27O/L?=
 =?us-ascii?Q?5bn71KmEulHh1PzWECLN3MVqpa5OdO5bq0zpZfxlf8dCG3fIS2oj7SijPApd?=
 =?us-ascii?Q?DECCfoNZOUQDCzQbMwEceWyPFb7C6YElVl1Uvj+zyf84OV28rChlBXh+JpZS?=
 =?us-ascii?Q?QHgBmmlBaM2cMjM9SkF57rEGBBCw/Jacd9IhzYsWSr3YescaZI0HuBS4vy1F?=
 =?us-ascii?Q?qyYz2CLr0h/5AkqMcfEQh1/p9rfqVx/ZtPIirzd9elHyTK38pKMhfjR9tK/m?=
 =?us-ascii?Q?MCDyYZPNxqQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?flxx+PKJxk2yUOXlToaGAX3D3YH7eYT2ud7JReGRCu6+y3jtLcHqqhnxFXSK?=
 =?us-ascii?Q?kvC+dqewmtaM/Le5sBzwpoJ0i6dBAjByobdmmJksqISVezqJxYxrZsOtrdGC?=
 =?us-ascii?Q?63C2bAqtiDcRrzLn/4kG2L3NToUOmzdOeZOhywWr9HmHmBQ0revCI/+fRipe?=
 =?us-ascii?Q?OE/qTA+8tOwJCpdx/6NpMtF/bXDnmpyigb1JBt8y1XVAfjJnHvzNR31/OYOj?=
 =?us-ascii?Q?SylL1YY1IDrufZ/M5+GZHbyCmernobnuFRA4IZFvavx0qlO2ugSIMaQ6e+/d?=
 =?us-ascii?Q?lUP+Vb4hzWCiyePXKouUUcl3Sz8L1QvCy3wsUONHqkWxZbMFWNYNXxhnMkhG?=
 =?us-ascii?Q?tNkqnVCUrUUEvM6cu96aR+RmV+//rRmTVB4VBN5+ubY7rrQ+9M8QiJdmiiMI?=
 =?us-ascii?Q?si3Y7OkBcIo+1kiFGbuoo7imz1dXhSbph85UDn7sjx8fNLULmBWsejrcIh0k?=
 =?us-ascii?Q?A594Rg1lVeYFDELlC+eccQNJ+DWVRoA9+p+8y37k7dWxweR8tTzewOxKK2kj?=
 =?us-ascii?Q?h7qSGKni84jlU0ntNgVZTN1+tI+cPT51+//v8cyLgpLiHPDOIOnI+YJgbvNk?=
 =?us-ascii?Q?DBIq0e41QBMCmUby1g38rAFi8d9+uMlnFBZzRntKI2X1IwJ4OGKACZhNnHBV?=
 =?us-ascii?Q?pBhwFazukqkIP7arpRV6excz1kLjcf7ZD/WvhWJcwdux/e7la41r6xUC37aH?=
 =?us-ascii?Q?w4lDXxbcf7EP4yG194TKY6GBG+bI+glbLULcKcSVqX+r+6DRlswlYB8edR6Q?=
 =?us-ascii?Q?/eOIMcOLI+f57kpWHoykyEgZpU0aFzvlJvBH5UAVpoAiKj7heOD2uYUOhUOv?=
 =?us-ascii?Q?+DDDPZrIgKdItAHk9+5oldI/mViyhGZ2sNIs7RDbDySo4TZvUB2o5VASyERB?=
 =?us-ascii?Q?YesqvQR18ppPMjoDH22XDTsjO2DyzXp079jhTY4UbDnYAzAO6hkJs+4gL1aR?=
 =?us-ascii?Q?XCj4Z6hyceBPSvXJetXPuNBxEuPtRi8YJREgMyIIgHpQCuKO21xOkxdSM7Tr?=
 =?us-ascii?Q?RQE17ianuhM2tYOv1nw1BCz69DxSbjFEuz0Kr0exsPOJzlVaUSuun0ulAarX?=
 =?us-ascii?Q?mm7nfkfk1kLBAqoG+xEv35Ui5rf28awk22uo9T0PtBusw91Gp0LdjzmIAeSN?=
 =?us-ascii?Q?2mjTIh+gAjng8mGh+RPLAQFx8BMJPkN9TSCA+j67Ho5TqIpCqeAxbARsuiqR?=
 =?us-ascii?Q?wfWQ5Yx1y97R5QlOUFg8QJloqNkQb5nQ1lkA7cMuTogWnRa43LINp1+s2J6x?=
 =?us-ascii?Q?Fw7aMrDXXk8bE60FpanVaiY5dgOSt7p4Zep85CgayFCmMMIcx0e1svvPaEn9?=
 =?us-ascii?Q?PE/XW4ICTK+ujS11kQfLG2VqRlQk+eACuVuvcmN28PKW6fyDGcc+cEXdNHDJ?=
 =?us-ascii?Q?OKUUQuksxEVV/9wF+yPylunV5BTw6IBiz6Cf9thLZx4jqEqAUCN8Bl3QqyRB?=
 =?us-ascii?Q?maWgvYX3+wqszI+l84CQlrdIdlZsXT+dZ7gyWd5vIJ1+toe/dnoDmZ8B9Mf/?=
 =?us-ascii?Q?Ii+L4IbHqsDQaSjgpVnON+TiFP1Nl5c/UjanCwFBKGEFsxsCpIzwC9e7wna0?=
 =?us-ascii?Q?w8/xi9frZeLcC+pNyjGkq88wO7UK2vfv5YtIQevVRV7uWVHqmYTXGRjnCwl5?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A+NtWPCgtb4MGdOACiU/TNFpn8xX4MTZK7+UfqM4L5jp1tf5i1bU1lP+WH8KaoSUxjTq65dBF6L7/virI8qU2BVu/0dhJ1vBpRUJ+BH8Xy1meXLdAPCoaAhHyUAxvP6HcsGe7iSTP9bkGLdYoDIiBgz3u4yhQMln3WwqBCkDz93AghRFROeFi3LcYkcQISRLcyLU5PYWVXo0BktPj4b6/RRGCbdlQdzOU2zlCvl6h4iYGCwmL1nCEXWN0UMvOUAKQViL4ppX3M1rpBsbm/oGWM4Pw79/wI3lSOf5zGc8f5ul1NnihxymNIj+/fYNRNbrcbLI6b7Issa9DNsLfxwBO1irFJyvySHp3Nksi8/+b9wdN1S+yB563MwCZsDJPntwD+ljWUNmIud6wNnV61FO9ulFumMAB0WmNfea9eY4HU0kiLhb1Auvc199V9Q3pFuOEfhlVxrb80KbUTo8Kn0XFQySeBWigai+/AEHvDsiEfiWTZMENCmC+UrjOBbHd+a0/Y9DTfdxAzuoXdDqrycY/Z3phaRxg7A6ebtG4CS8dTGLILxTxooaAY6jFtDmqnm57phECx0DZBfIPBHjviAPzIpq2Egeq4EoNF1WJywdr20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d59efff-9147-498b-50f5-08ddd492214c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 02:37:04.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOIogiriK0oDArDI/zktqhFHYKSc72cy8x5v49NyA9xnYrQclwwU7PUsMsKMxbyeNNW0bamhQdcKHZ7QIp4Hbw/S69sUHTQUWD0Z3cyfsGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5605
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060016
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=6892bfd3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=3naVu_GUDoUUrRWhfsUA:9 cc=ntf awl=host:12066
X-Proofpoint-ORIG-GUID: SreSrTVYtBRzKUpUU_JHIBt9qtAfePV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAxNyBTYWx0ZWRfX2n810ARFPaSz
 eg9X50WLhQ0gs03j5uA7wCgJPqx1BMvNiDcW7vSSSXbcR1aPRPohA3FXZl84JksTmc+FSnHhQXl
 1GW/2wzMkNeoqto2ONa4FyyNRyq7tsDTdo/7zqMQjUGaeV3GE4VgN0iMKPPbhTuuHN4qtFJFzcX
 6yCJGq7CV548vTr3KFoIiLxRCkG/xfJL20nch0T7pU7q7fqEOH1NNLKX1SlscopBi4BcN+FmUjo
 tlnCBLLo4N84JXkhrA9jhMNdlRJWevpUsUvMv6G6xxr2GnZiZzbgwdrWiAz32JlUyDu7QePv3uS
 HdiPENtHol4hXyx2hZzi9SW6vi4eeNY4Prxym6ZYnpDz1KpZFKZqhEl0tC8Vr5P7TSz3Bs9dzZn
 21iuXyz/bJq/eZvu7OHY0OwaNGbv9IEGY6sdfJIaJ3wm1ESBZmLdGb4dQP5zjwHw2boOvgN0
X-Proofpoint-GUID: SreSrTVYtBRzKUpUU_JHIBt9qtAfePV2


Krzysztof,

> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further. It already includes several conditionals, partially for
> difference in handling encryption block (ICE, either as phandle or as
> IO address space) but it will further grow for MCQ.

Which tree did you intend to route this through?

-- 
Martin K. Petersen

