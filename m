Return-Path: <linux-arm-msm+bounces-64853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D0B04696
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B55B91A6148B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D93F26529E;
	Mon, 14 Jul 2025 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A2Z5Qy+F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZAlj6Y5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20818E3F;
	Mon, 14 Jul 2025 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752514554; cv=fail; b=hvFUU8eUNvfKfIFTGLWOkrH6lXS3ae0cCZ9eVOZWTSRpKDx8weBDXdy2udE3t49/ovFLr4g6/q7Y9tMP0oo6QRy+ztexB/IhlEe7WHMYA474T9PhCz6qQwjul2sXhN6IDQW5ckhnF2Byb9ag6CgM1MVRIE+84FaMimuFLZ4Fq0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752514554; c=relaxed/simple;
	bh=ht28cJ1VgYK3lCltN06tQuFy4VRO1yM7xxqy7wsBCz8=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=QoRZsE+4YdvYFIeayaWqEtHV43SaZjQB6/O9LEjWsiJpSNm43KxTqEfQGX6TS1cIne7MdMQbtIW8EzGAF2YsWxxBxPEWHLhfKSkhLRvKe1q6Tlv78LtEpJ+raeST5mDE/kdgE6KJtz05dtpc6MFAV2hoRZmI4wcfwlIcrAXvADQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A2Z5Qy+F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZAlj6Y5l; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGxj08019113;
	Mon, 14 Jul 2025 17:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=P76Ud3yfXYrVV4Xfq7
	LtyYhMdZ4IUcCG7B8EZUH6QVg=; b=A2Z5Qy+Fbdey9OtuRwnavgVWtiS7Kq8l5i
	4nOc2z5uCOFI4i87a7hIdHnPKbnFJLR2bYNPVv+pnuGz/ST/lU72jio8TqTJNd8u
	JI63xjX6lwTiT+cAj1CxV8WVkCrYE5T/lXmMgiRGHLpscVqG+Qr6f1fZp+mZo6r8
	2QiqmgohNqINCgKjCOgJuDHXsQCQSNTnD9+RXvh8+Du3sfGPOWn3ANSCCWJpDBgz
	rd/V8QG1qc8bkOyfUZPZ7PxE4qLX8E9/tKw9OO6SuaN+rpM2ILfQdFT88h2XkSoi
	LeEbycLmWMRLKTsZzhOcZk1VoGVsR+QPOIDO2WNUfsauSbBs3viA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66vjnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 17:35:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHDOvE040542;
	Mon, 14 Jul 2025 17:35:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue58v55n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jul 2025 17:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEBxp5xNUCYndZt3SNA6I9zfEHDJK3GV8umc4wKs8E1KSjPWe/1NRIadCQ/l+kEY+Jzs+0F1RWUQIHADi3R7B7j8l4LBGiBr8fAwy5lM0U7Ul0+dC658zlLBmPfdfKIiZJVnzAukID5MoXcYxnYZn+ha6xl8Hfx61MM6WrOu4Tu2I4HjImnvc1OlaKva7ncoq80O1KEjyQj914vn9EBAFaszsHZhzq21KJcU1XzoQaTRH/EG6in5uU1t5nAiXXbzQ5TFl70bHKTA+GWuPnfUBWGMfZrOuuqcWwg4tTGvc5Lle1w8bU6Kjydklr285FRpgmguaqW3Joyx/pOutp+yDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P76Ud3yfXYrVV4Xfq7LtyYhMdZ4IUcCG7B8EZUH6QVg=;
 b=fns3Uy7ky3zu8sQPHF3H+lGuonEs9YlQnkmcPUS7AfNItTIU1mjOmleylmnbbNw1ZlgOZHDUr/Afsh/8nS6P047SCy/Ic55AnvfKWp9YLH7K+1L74EWTWkZbqzwM0ASlg0Ul9wX0LYAg3vCpeMjogt1vr/aU5Nc6l+k2Pq4WWDipTbwMf00tiJOM5qxjv01My7LjIwuW/7dROtHtPfKorQFxfNNAnQJfdd46br/qNTh1FX3LQW1gcgyJV9SU3wAeOm4YRbPVGKLTvkg/dm6oPyF+ZIf7OZShxRIC1lKcyyEx89cV0YcibhlFs2JiGw4A9Kmd1hoXuiyPolv+AoJ4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P76Ud3yfXYrVV4Xfq7LtyYhMdZ4IUcCG7B8EZUH6QVg=;
 b=ZAlj6Y5li7u8rUdytBsJe1oOcO4tWpKmEeR5duG/HLwxr0n+y2JlBZOp+laK9QrMs5dbQlcBeOZJ/adMumAhbKKMkNO98Sy/k5hfxiyMCLmFDIZtXAFMF4jI0AJZr9vHofCisHXHsDfbzeq3fgKyvjgsWWVlI7eNyn09FDwhXmY=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 17:35:37 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 17:35:36 +0000
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        Manivannan
 Sadhasivam <mani@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        James.Bottomley@hansenpartnership.com, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Bao D.
 Nguyen" <quic_nguyenb@quicinc.com>
Subject: Re: [PATCH V2 1/3] scsi: ufs: ufs-qcom: Update esi_vec_mask for HW
 major version >= 6
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <ef319052-4fe7-4512-a6b0-e9148e1414f4@acm.org> (Bart Van Assche's
	message of "Mon, 14 Jul 2025 10:28:56 -0700")
Organization: Oracle Corporation
Message-ID: <yq1ecui8yll.fsf@ca-mkp.ca.oracle.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
	<20250707210300.561-2-quic_nitirawa@quicinc.com>
	<ldid3ptehto2kmzyixih73vc7tszwdiitr74rnwklxeeekwxrn@mm7zmyfickda>
	<5a1bd678-c935-4c1b-812d-a249f1caebb7@acm.org>
	<yq1jz4a8z8h.fsf@ca-mkp.ca.oracle.com>
	<ef319052-4fe7-4512-a6b0-e9148e1414f4@acm.org>
Date: Mon, 14 Jul 2025 13:35:34 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF00003859.namprd17.prod.outlook.com
 (2603:10b6:518:1::7b) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 032d043b-ce22-43d9-6fed-08ddc2fcd7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?048TmurpyKPgQZ3xH9kgCFtZJgMgh+cQBz569jDlrQM8TERujgywy1Ty+zia?=
 =?us-ascii?Q?d4bNY2cLDi1KJErk75q6C0Dw7bz3rpBcNdvpRXMN4RsVaBuzXXNsZkbO3NJW?=
 =?us-ascii?Q?yEByWotR2hMW8Zf7MWu3JJhLhXm7jjXuSoKApwZ6CGDn1h9wV4WvUQ/pALFU?=
 =?us-ascii?Q?cAg9QDVvxCK741piFpgOMAo1yxS1jkju1/UjK2g4mWOSDUxOCQsVECA/kta+?=
 =?us-ascii?Q?AFwMsCzMFehzZZ3stk7nLjH9rBxbFzXSdju0EKXUONq62wjbEddfB8pf0jFO?=
 =?us-ascii?Q?oY9Vm/M3i3efMmATOlI4TMefffIfDGYU3cXs3+FBiC9iv15NjpJlt+4SX5RO?=
 =?us-ascii?Q?AF5zFCdwvlYIoxwvvNUq9lI6ehTbjF3EdoKR/oi/bVILimO+RRHn7WC66apf?=
 =?us-ascii?Q?hkoXvqHq+fkemCt2gIWdhWyZTIr7Oc1/eGaISY55jA7TRqDEcgBTrVJ3AV/i?=
 =?us-ascii?Q?clE3tFTMNByU+m9xZdnNxF/gpXqNTP8rddNWSDlL7pJPNz3i21cSKxV7ZWw9?=
 =?us-ascii?Q?d90WcNWAdPYpmptrzYbWCdNF2IV2t46n8v5Qt+ML6bhHXN+vmS5nYRFe2zwO?=
 =?us-ascii?Q?pQR1GLuCcm96mkBUUiG6lDnqn3+ET+Kd3IrfBbPwps540Mq0UmrxXWvlNc8w?=
 =?us-ascii?Q?ERn1C7qmgLdMvUd7WuoxTnYZdPcDBYCrqziHWSo3IowCYBVYFBai+mDyEnmW?=
 =?us-ascii?Q?isEJnRNza0Qt35sHxlJoROd6bvnrhBXS1pVb2RvIIWlj+ANrtosvUQDqQJsb?=
 =?us-ascii?Q?/5hLpGz4Ud0yIK/BplxZ9FXEOwoHnybc6b01r3BtnVFuq7yLtsNuhKaDbQca?=
 =?us-ascii?Q?CLU7wvisCdoIh0qwUGfpEFTvww0DHqsLm2WYajZV2KFVqqDrymQ10cxtEp7w?=
 =?us-ascii?Q?FDibEgFuntU8/ET12yUglMTfac9WH2HYMaXdwPSIauOpOeJOJHHo35HptEwx?=
 =?us-ascii?Q?P4+pfvYxAg6/22vBKm0WEJakoZnlI83iPVoKswtD67+NN0bZVeCgvN0DpMId?=
 =?us-ascii?Q?QqArnyeqJE5aaPmjOcfh8rjGxi7HUleOcWU4/1Xb+b0FKcM2kzQ024u3FkDn?=
 =?us-ascii?Q?/mM3F0mFDzSMg6mLPrRceL1NIQnvxRDB2sZKUwJEuo4lAb5Qdo1tmJp0cRAb?=
 =?us-ascii?Q?zo2f/8Sn8yhsrP1niRy7PPWuESvsj1GYmZH8WOmr9O7lh9xJhWsXbsuAz2zb?=
 =?us-ascii?Q?brJzZQae/UHSz9RansX4AfqzgWF1Vmh+agSxU7eGvt4dpc2mxx7r0kHRH7CE?=
 =?us-ascii?Q?t3fOmzt2r6IUSlDl5ptmMUqgjdzn+7F1n2QyNV9lB0evA3rK0jfQvZMqvFzF?=
 =?us-ascii?Q?WaZ4SqLQqAtS/z7Vu169/UaN+7/bVeGiVBYFzIJX4wMCnkvnjI9PloaOOt00?=
 =?us-ascii?Q?5CtdQ202WQLripQpZX469bulFvy/gQX2bC0tPoGQzKqwTL3mVqOdSa/RLvB5?=
 =?us-ascii?Q?FYZz5CEAo0c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?emjJmFgVWb5rv28eDRx+SK62b+V3gHF53OZoApr7VNCzZbQ9ee7M8OSJ7a5u?=
 =?us-ascii?Q?64q11tE+XQwVD1Kp4Iz0S9l5orfrgZJaBqqtYzLa2coqQy+ImiMPjX3fUiXs?=
 =?us-ascii?Q?Q6Nm6h1ZaDL9c4FbKzoMS+Yh0M8FSVXlAiUw4ExqMiUMjYICIeZVTg03m1TF?=
 =?us-ascii?Q?OYQv1FOjYO1tQoWQK5/xYhosk00JvKfyTxqbMiODdH0xuPXR/r1F6HeKtDW1?=
 =?us-ascii?Q?Df/H1Wae83dP+ft+EsMKiG8ajNpM8EzLvv8+81q128sFI/QWFIWAToRUq/Cj?=
 =?us-ascii?Q?w/kdcdfKa8luusCWprs13oOykDsXmgt+ZDYP00SrIZ/7wEtxSCT3Wtj8LvCn?=
 =?us-ascii?Q?9kYL5/I6oyoFgSZZ7/Hg0oJuwO/+1/R61JABIKbt0ts92U6PR0GaIvPixrJO?=
 =?us-ascii?Q?0g8EB5qCNG65dUl36758xpYb3gdPMpctP2LcMGU2QzUJpKRZlQJRhDh1uR4N?=
 =?us-ascii?Q?wIVlXTM/kpz8haNpD3N2UmHb0DER+Py1DexXAQSi+vCv2WgQlyjLFkNWN21t?=
 =?us-ascii?Q?A8TS186bhHCBariqfJQCvpZ3ccSBWhMmjFncepDjHAM5s2MJbjMiXQxkb13j?=
 =?us-ascii?Q?kBCHSYcbqh+m6ItArFWOYh9Qjt3nhQmYWUQO4nAWhZE96wYCJHhvViJwlPw1?=
 =?us-ascii?Q?RRPDf54Hwu1MZiZgj5ItgYBJyIWQL2rEk5Go4BN4+dgYikVbEgscjjocFm6c?=
 =?us-ascii?Q?FJKnz7FAbq2gWLIbawItp4O07N48U4NxVValxZ6uPWdjjeh04yy33cJ4f4dO?=
 =?us-ascii?Q?5BbFCVINRXB/xVz/0yLghkjnFGNTqz0IoE5u9jb6jfZ+CARoLux4goidxMer?=
 =?us-ascii?Q?o8bR6zBQcBFW1K9JNLKn+jbWnL7FizhVVaPnmz+PsY7n2QQmGMFd5W6+9E35?=
 =?us-ascii?Q?PlSedT8NkYFdepeTCR1wRNfI4Ac6LkpqZ3cN0ThysTnQrMS/C0T3XfBkGgP3?=
 =?us-ascii?Q?WF3FsG8P+9pRgi6xUFZV5is0a4hC+cBJ4NxpQe2NCSno4I3C+/m1LYxx+aT9?=
 =?us-ascii?Q?3PPZZFmsoi8opv0yKO0/5rJwIpiTZTk63H8xw2yO2jI2B82vJ/3qPhKhhgd+?=
 =?us-ascii?Q?Irkfq0bRWEMioqPVoq2n0PPzVz6GvTsNf67KCPkUwnDdm0i9ikiJ4dmyJGlk?=
 =?us-ascii?Q?pf75N6MmgjQqjzqfWRFlawhSYnFQ9XydnSPCp9+sCZG2gtij31fbsW9hw3V2?=
 =?us-ascii?Q?A/5k6oQznVSIfc5mHidPZP9djltLRctwV7OXK6dsd9NPYqJGNiF3hZDzOiX9?=
 =?us-ascii?Q?x/biC6l2IOVTlOhzPmp+OZjPuQhuk+JAeUkGvxBdYoLrrvNEiddC2VYMkQsg?=
 =?us-ascii?Q?fASTp2PpuG5TfM6Qcw4ylRndnBB8VPk85nGK+u3Xk82hjcAwFmFJGZe76Yy7?=
 =?us-ascii?Q?1+qtR5zdLygBirLi4EcI01hrd/f2mNad1CTswgT8fx7yrqY92se80vdoQEQi?=
 =?us-ascii?Q?CYeblTWTmJcs6pUP7vfyJ/YXtALZIJRhfQvWuxNg2B9NsKLEYPnv3f/BhseJ?=
 =?us-ascii?Q?zpWLKVbW1vqpPfn9kpTYRJexII+hrdCio99Lhv6OTsm0AmF1uzuM2m502oKW?=
 =?us-ascii?Q?x3p0KdXKBYBEopUxxzM7bRMh9WxzWP8SFDSVWysuFqWfxW29hYmtsxx5U9iF?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mpt8PkYvvptzlkjzv5/kpl1bxhcqpxzoDnq06t9drh4C/KfHlRTGaUy28szV4vQKwVDYrE5TN56fzt4RBK8EaqGo31q4pxF4ceZzZMiIxJXLZEpDUdB15XxxAw/SbJySD1HwbDK+Gd99bgLXN+u3hTiPr8EXiHDJIOFcYgyBMTYjXSIIqq79GeqA+8V17lsMnkRo4G8V8pQ29552xM1TvhPXev0W07CGEo7X+vp1l2oAiHdJls65kM5ufVEQhLn6qPgmAKKRY7WPawUUI4AEyzvIFwjjJgO2RDD0lUXbHyNUqiG+RYks6zujR5wWgfUZS5DZgKz4iv/mMZi+StvETYJe1rQ3w2OxZYrHt30VJtDxBE3cTnVSMoqSixXuOzWNVtT55f3lqQjutt2bNxcVi/ZGZv+j+mUYYjldJZeD0PS11JjZ6bcRc8h2/AhpIrTDPEKNpRPR2/s0iUBkKD2EleiXbU/BLBGWk5WXvRP7fS/XgK78mt/D2NE/9+aeGs3WERsVasAofVl2AFF7nwtLXwsbrKijmhXxdsvFSXpLJE7+YpdCCboWlqPE5uuykHz8U8IsdGIJwaEFIwWutHIURpEuao9augt0B0iUD3tkmhE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032d043b-ce22-43d9-6fed-08ddc2fcd7f1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 17:35:36.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMf3iDuVWGCN70iHIyir4jnjPJmCTWSke8/d6fpe8JP4U0BC2AXsHsmhirKAXEnvjKwLCFjN78tRMOaXBZhggC8sFz21r7sZfSYe5/W4l7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=947 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507140110
X-Proofpoint-ORIG-GUID: BWqkAUwBZJGv0NIWIOi8gEC_EUIoaK5r
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=68753fed b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=N54-gffFAAAA:8 a=B-KBg3O6aGZWCdsBR2UA:9 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDExMCBTYWx0ZWRfX+an1Gy9I/OCC KwB5JNF4VFI2VV7kJr+avxLCztARskgQB5noTihjIo7OsJh7REvCwxWvSO7OLyTuDdf16nxUNSq RzWu14N+YTA4ar3WGd2x8lC9t9xFpbNlYw6JESnT71NHeCoKyRMxPmEoh+TmRZS8Mo/laxrui4g
 en06kQueTVPGyNmxTKwbpUFFjliquZh2jiHTBKWLrOCY5IDMyczMY/XRBpTQWKP8MP2P8rnHxsf Y7BkPHGacHYoz6yvGSygbP+bVT5fDXHLA6EcIv+Hgg4v+x8xyPpcfhKNJ2rqd/FEvCrFNnb32gi NdWRai1we9O8yk5SMRdtBGHKHwFnc2ws73/gG4AGbYmBFFEdcTrbrYQw8fFz3Nm6QC3HurkfOP8
 Rg89hVYp+NCuc+B90MbQz/3KRB4SBDLBMDdpi31h0pI5fdtzC2OL7XAJ0zJbbpp0Y6i71rmj
X-Proofpoint-GUID: BWqkAUwBZJGv0NIWIOi8gEC_EUIoaK5r


Bart,

> Thanks for the feedback, but please keep in mind that I plan to repost
> this patch series soon, a series that includes SCSI core and UFS
> driver changes: "[PATCH 00/24] Optimize the hot path in the UFS
> driver"
> (https://lore.kernel.org/linux-scsi/20250403211937.2225615-1-bvanassche@acm.org/).
> For the future, I expect such patch changes to be the exception rather
> than the norm.

OK, that's fine.

-- 
Martin K. Petersen

