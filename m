Return-Path: <linux-arm-msm+bounces-59169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA32AC1CB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 07:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D42A440F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 05:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E86204C0F;
	Fri, 23 May 2025 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="bcu4x9wV";
	dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="D+A5p7KO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com [205.220.184.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919BC1B95B;
	Fri, 23 May 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.184.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979890; cv=fail; b=I5VMUZpeaEnYOPg684IM+qep6soglDdw55STiYh4bFzsv2JEszGNg0IqqhQwSGepqARmLaazKRJd9ba/7N3xkXfr5hWghpRUpa+vgHq3A1qyEPyQExtKeSNgBKQafH17Tq/2EDUKdOfh1dZo6YLCjEkNPTRni2PLd9Ir5c8NkAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979890; c=relaxed/simple;
	bh=LCbfBDW8lltvLK6wdKLqMPEQ7dMfXlC2k8i30MRNTbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b6LKE2yUvPKz5ogxmqmImjxP1X5kMNYAPa4FJ8M8vK5ETT0omdS7ss1yJbIpIGJruBasbB8mw8hMTws96KY7PrNEuUrYuHVw0joIqywa2Btvtv1B5KbuAUqXD85ibAVzAX2XoU0voUzl3obQ+2d3kBhpPM8OHJyB1vSWRGkrBzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=bcu4x9wV; dkim=pass (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=D+A5p7KO; arc=fail smtp.client-ip=205.220.184.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N5MX7B026466;
	Fri, 23 May 2025 07:57:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=270620241; bh=n9EczjqfsrMC0qUs8GGIprFZ
	AMI/3edOvVeYT+o9ZgM=; b=bcu4x9wVtwhUSiSChjDfI/PxJH0i3NpiUg8sfoCH
	l54X/YjOuOMR9V3S3yTPFHviWLcxMVGkNK7dnygLPUBE6GcLQt8zZIstwLwPUrzG
	BTQDieIfTMG0bbQ513BVyL6knNSjkggqVN9Vp5QDBvcx5jBtVHY95YZ4trVGC8M8
	L4h7SeDW22ASD2fP5LEaCtWCCiPQ11K9AHdghGKPRzwx0I7562ZCmmSXgFXCSz9F
	UMYpUhm6ynqMvM5VZYG64iiUH7/oeanMPplCGxrJRdA9okShgwrvKk5kks0XWByZ
	M56sCXBNjNytgD641M71rMvNuc/xYsDqsI6CPWO3scVIxg==
Received: from eur05-db8-obe.outbound.protection.outlook.com (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 46rpf3kh6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 07:57:59 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+NYyqdkZ1uvAburXeyosTkf2d/lJw5VCtE70NdE1IItPaje9eLT+z7rjkX/6GNRGll2cU3ZHECpHTX+m9MZMS+R7BdeAsbWaYB+lNi4/YdCi6Eyj4JBOJVXZuesNt6OR6eRoOSmZ6yS9eM/GSXl8ooLK8LASRQoZQUfLt5MZTFR4GUmWWzGRo3maxIgpqQQiClkhUN2Cnkax2LVCc/up4SUoOB4Ql+K0++emUGtcbQioG1TwoXvsdFveWXkRckx/7/XxJDhXeT+XLyQohAL3tD1YfgOER9A9m9GJQ/bFPvTnggCzPfAtbuNaBT/6MIqflW7sZZKwGllQUTMMn78Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9EczjqfsrMC0qUs8GGIprFZAMI/3edOvVeYT+o9ZgM=;
 b=KHt56NvCC2VROFkmQlfUAo3EyWxgFIl5WT+zNATd16vaGuCm6Kx3Rzt8jlf625gJUeB5mMqorXDFjjW2sIZIaDu1vbxNZSULubY8ivZ77jWP9m/GHC60IMwp7R2phYbymMtS86D2UptEAN5sVxgWR3bVci7+q+eaHIknrGSqLr2Mk8JL9nkUQoTJlpczs4T+ljrV5ZCm/X6MkBqamN/9KG3M2WLwMRVmbw7ycYtK7/ozHXTsQLwd8rrdMNuJh8UEAdpC6bUgtiTuWfY9iOXKQXW43qT/n/bUkNyNJ8YvMPJ9R6EkE9tQpmM/3ICOblluq8c7q2mpjsjMwdgrQS2w+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9EczjqfsrMC0qUs8GGIprFZAMI/3edOvVeYT+o9ZgM=;
 b=D+A5p7KOlv67OqxFm0vgkaXjWQoAHUfc+047Qkl9lDQuSLITZ1CA7z55vg8PjEfDZI7phrTg55rx8YOnCbiMTSrrEVjA5X8OtnUj/0oy+r3PdtX0eECZjdnYDNJhPDjwRcRFx3QWS0ei/ms05PykBSSgMtv/m8U/CfH96OIHuLI=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by GV2P192MB2013.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 05:57:53 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%3]) with mapi id 15.20.8722.027; Fri, 23 May 2025
 05:57:53 +0000
Date: Fri, 23 May 2025 07:57:50 +0200
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <aDAOXo/ujOcefs04@FUE-ALEWI-WINX>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
 <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vf7fb7jxxwy25wzow4pbzvh26xqd7hkx4edqmcts2tzoyrnxqs@u3lev7ergjb2>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: GVYP280CA0021.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::29) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|GV2P192MB2013:EE_
X-MS-Office365-Filtering-Correlation-Id: 818a6505-38aa-4b69-cbfd-08dd99bec1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ewI+E/Zx42aD/+IRUFIE11QHDxKPbBXIKuAOcY+2qstVebV9nxxknCZBUIGt?=
 =?us-ascii?Q?LayiR1sGqEznhwaG5akZ2gcI/Rk5Ve76G9JxbgWB2V3zK1cD0ObO5V/zHg7Y?=
 =?us-ascii?Q?X+zp3r+FQObsDyxSDRgBg/xsYPebeF+7jo3EjdVeGXTzhrhRqu/ff8QyywzO?=
 =?us-ascii?Q?oiAJiWG6J2fNqXtsTuKA3YWkqgVuJOn0VaWJu7FSInn4er6qhWlBMClKxehD?=
 =?us-ascii?Q?D+rTAJrJM7UUwB9m7+iOvLcxUqVW8H9Q/dIkq6EXN/okUpA/QPKvxtSvKGbV?=
 =?us-ascii?Q?QzBOqncs4DMid0Xh6nN/dZxe6xLEsptd5sJwb9B0OYkvTRdplDELnCwJ9VIY?=
 =?us-ascii?Q?g3TgRUoiORdp3BrYlDvUH4agxQmBnI4jVAPIVlsH3w4GhUBnJi2pGYQYuC5f?=
 =?us-ascii?Q?At73T1q0cziSR35INRZYlyrmCJ+r9MTRUWCk3kivxsz7HrM4ScEDptti9ylf?=
 =?us-ascii?Q?+SG0UiJ4YNgbfi2kQeXcPEBBJiYEtJWxB/08R4f/VkBonFHVyRJ4PYeVs2B/?=
 =?us-ascii?Q?P8O1t9ISQqUa+Kb5l5Y5gpPBTRSIDA+QzB7jzXs+Lmv2p/bVj7eFuUakvcTV?=
 =?us-ascii?Q?6Ws3+/v9kg1iyFxM6M8reLTcKNVq/PKfUDvJB1ItpadJtmsepLZZPiWl2XzD?=
 =?us-ascii?Q?sIBqmYkh65R3j40kkb9lXcrr663c2jgFBl7+XmEXkxhM0nP/vB+7AUxlGHmg?=
 =?us-ascii?Q?ZVY6G+ZdZOUpYNDP7jJP+NpsVhXpZl/1+8qOBrX69IPUo9hy1J64Cya8014D?=
 =?us-ascii?Q?4p6xH4EoSVgxNWGPbXQnYnmom5vY6m8Q+9iH/xpTH5cShGoC3hMSv0PX0Hsq?=
 =?us-ascii?Q?uhz8pgOn6idqSusr0RJ9BizlDFGflKFIEmRHFg3vz0TXH1+NqXdUuwPToM30?=
 =?us-ascii?Q?oIdI3sDzV9p7+clwOjd6MdkesotfAOBnZsfbzBIbfDMbUPPa/5jCTXFsXmVU?=
 =?us-ascii?Q?RHUDYpdXZMwYAC8jP9FC/8+9a+9sCqeJwH/Jy9JyiH1EV27O7HRTsO4vJLzI?=
 =?us-ascii?Q?PWaDQiJvVWRAwRL9ohKwwR3rD4DxWwvDHkPJxONx0mvRj78whrVDE7AUUsjF?=
 =?us-ascii?Q?+K+IJdJgjs74+dFnBiFv5sdg+QGrLKORLSfBx+NdU39ZdOdgD04z5HPrf+7N?=
 =?us-ascii?Q?4UwVjRi+UUGfREMWzBqjL5Ewnbn5mB0uxnUrsr+0JwV8yKiX0MCWK7xI0yLK?=
 =?us-ascii?Q?DHl9YEB1jvrrHfwSkU74RJ62Lm73WtUQS1LNg8IvmggnT6jB5JjuDA3rV6+o?=
 =?us-ascii?Q?0KE3fZAkkmFhN7YKEzUoh3TTQaq5RYPGCN4tkBkWMEoWkEMVj+8mlJSWuf2J?=
 =?us-ascii?Q?OLQgnHns14hQUT4VR5YAPYNMzwWcp3K8R9xN0Q/JFsIRmRkWsnY4YpyjWyAl?=
 =?us-ascii?Q?jjO75bf+oyChXIsTS2W/L25K3ow0J2vt24u1MdQoNYJWJmw50F1XilZTEToD?=
 =?us-ascii?Q?dwZ/bxnsUNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QHRwsqlAJkJruVbhK8CmvOXo9IAu+JROAEp+/pkOWNnQgoZ1TZyLyZQk122C?=
 =?us-ascii?Q?vO+yh7v+nQy87QuJ3GoXKIJsq7k21n3uovlrfcOz68SMl2o/SlLxG/m0JlC6?=
 =?us-ascii?Q?qmKkWYLdA2sKkl0wsnIllFzKbwWKIINKsdRjR0TDjO/qxabY4y3CrtYJhUwS?=
 =?us-ascii?Q?MeUEzE53bmYr1fjkujesSFiHi7LT3aMdfOBFseFcKr6IibhCNZzlLx1xd+ry?=
 =?us-ascii?Q?oSZbpWa8d8YD+r2ESpd7ajzjsHm9YUp3CoqT4LIUg83qy+otb/mgvNESTfEd?=
 =?us-ascii?Q?jijo9s6eSler4oGcEMEbTlRgM8R68rWOIquY85YpBKRBPetETfnXDFL7E0Zx?=
 =?us-ascii?Q?rOdCNDs8Fqh2SVgw+2cvR/2b14kM2XeOpOiyLcb81aoR7gJkyWgptSkcO1jh?=
 =?us-ascii?Q?yIDigItjXjrWcUSM2meJMIhv4C6YCHmKqtSAtVmZqWePRfDL/6tGbW4WsdEE?=
 =?us-ascii?Q?B+5xkRR9kXffE25EBeB4jMzsseSfTvE6ykh0Bd9V3pA9gF3PWwjduZu5pQgl?=
 =?us-ascii?Q?GeWP0M2e1rDx6MQHYhYB2LL9vWsj+PcTw7RHP/sgLLZY8LbdL758xY8/JjxZ?=
 =?us-ascii?Q?XaPMddwfdqWHYFbMn3M1Xc6uW4a/dnTkGiVwsm6vrc443mWdZ6HqKbrnM5g8?=
 =?us-ascii?Q?+E4/9USOm+0dK2usy7Q7L8bcC0UT93xCpK0Kb+FhxSrLPDk8Ebs2ek/BdfJ+?=
 =?us-ascii?Q?mxhcjoMNALdcueo+qE6vd9BvujIvspmYWYGMOsl/EvqjyYNzNqYWG/QLMaCQ?=
 =?us-ascii?Q?wVypwPBjKpbVaAbKqTsKtCvwUSh5qNSn/pfGxsQgIrCC4tJGRg23I66AMjSj?=
 =?us-ascii?Q?fWHBo9niF7XRapD7u6WytIHLqq9Wldy1wM4jObu2ioNLR9oxy+YpiTO/b0Iv?=
 =?us-ascii?Q?C8kmIXLx6rpLJ6a6khMkiPYA5hLrnSGbgzYQvl334tFvoBDMorIVBjAmI09o?=
 =?us-ascii?Q?CW4LE9dGpDRl+cMmoQrfmM0X9Zo0Gm3uzDxgiivIPoZGpaql3wVu2KzVI5HN?=
 =?us-ascii?Q?Ma9M616OGHPgVd4bCNlepry+XbrKtEB4W9mg3WxCf+C0qBa4z27o0Qut5bti?=
 =?us-ascii?Q?JQOUCsgpIbNruwjpZeNrr6iZw2eHKIoSSK6JFOuQe8GbI6eQlpuiXdYUMi0z?=
 =?us-ascii?Q?5NbZeyWDoZxUNf/B4+Hec+emlJsoUiPZkPqnQZTcaahd5LySPgP4QWNwRv33?=
 =?us-ascii?Q?jM+Zp+Xb3X0deI4tndXaGtB/c4pLYe1/8pXQuYKra2vyu46JP6Oi+PXxImQJ?=
 =?us-ascii?Q?EWiwPDdbTWL9mX8FVEhTw/mQvWNLmRDoIluB0ObE60gT8aSPPnPBA7C8yw3r?=
 =?us-ascii?Q?PLAcEykbJxQWtKHKlgi39e0RI98gK3OrQe4tUUUiVfHVlX9wR0B+KCk3CELK?=
 =?us-ascii?Q?tLrwG6MRAMSAXGB227Rqh5+UkaW8h9ReLDm/ziQ3hlqeZ2s7bkhhX++1Rzj6?=
 =?us-ascii?Q?3pjNl2cLZcg33gvzKPlktj4Soezzy5NVw1nAh84qYe95YWtbQDX2AoeTM0aj?=
 =?us-ascii?Q?wHoCxmV5drNP4N/UtpLv3D5cGlcxcTgFgqaAq75eVsH/flVm+FWFWmRUfz/d?=
 =?us-ascii?Q?/3beRGmXJmM7EGKZrqI60/EY60MfLcTn5YYEuOZI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V+RRUgtWPrYO+b5/mxb1sHbOd4sws3749SwVZ5nRfl5Zm8ATwelmP6SWOvICRacGRAw1ABGta1DoaJiPXqQn25fwae6FOZ9DAZP0F+xizPSvelRc9EbEBXLMlUW6VYkXGNm4LcxtAqPVndImTKJffO4Qm0N3bi3a6HRjL520vgaH9+YJ5yxO+Vs1/kyIXNzdkzubCVH/w+rqi9wZi5b0ve6k6MgXar3FFWZJuIxXZa3uaozoPbduS7+DHQV9+3EmsXwOQBCvMKrp002g/FOazsRwSExO6+jNQNqGJjqEHnKv1Umv0DluQXyrza/eNWKaaeqmWtY0XR2CKcIvnIgHYByaSa4Q6dUbXdDxlj8RkAdIAqutb4dWB+5GuA4n5xK9b6eUnUm4UY1/4WhVbbxwInaG2dY+DaMrDdcl3gvi7v7ouwXC7o6wKOeFW7FXO/FplHA8lknLdJVAiX4rUiafbRKyVXlgAOnHH40fCmyko+wAEe9EUeCLPELMjiEkgzSco7fO3BExDXOKFO7wEekerae+IeOqDHQlUUeI5WpXNz7V4RpvWbmFoP9J9UaQR1noXDqm8pQcG3+EXxXLFTDWtvZE5+4/hNGBa2fjiCCokpxcthT5Ucj8i9OC5yj9VjPV
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818a6505-38aa-4b69-cbfd-08dd99bec1b6
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 05:57:53.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Mtn9fNGPq1EZAzoGSfIuHJyWTG9+V6EG73YaRCnkHBNCYEYeRMtRSIADjkBIvntlUFJxP6akmdroH0tLs25Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB2013
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: GV2P192MB2013.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1MiBTYWx0ZWRfX0MRBLOs0nqC9 VtytOxdk7AczR4HAFLwTQBp8fUjJ4pYXnde4mkb6aCLwkuCzJnxqUP01SVx2+AfSLM8y+Df1qxL 621DHsbraZuQiwgHlWJnj9OO6kalj6Sy7wqn2wkhfKMCyveXI7jIecoWJn5ZeukWsrjN2jA7OEz
 2qWCKBcwjuRMo85KTUmXnAPrGUIwRBOnzSZYOi9Q4dJPbeG1cMN8hX3jThlwkk/uJSI6+EUghNV em6uebRZi2PG7oTiqqsDk6AcvkSptOFZxwLZxA/kCxfwY8xE6LbaOKHQkkt9I6FfAbhCqq8m+d4 DF+qEhUZB6K4ijlaRKOy9ypgpTOZ+KvZHmvAkgd+RlLnaJyzNXtUAjjzeZozvJpV/fs48S2B4FU
 WGkVyejJx/rTZ5lWARN+NBBvlIKBrhlgUQ/3bJa/COmrcO+cdKPTfKuVsMHCbe9FdR8RAT8d
X-Authority-Analysis: v=2.4 cv=d9f1yQjE c=1 sm=1 tr=0 ts=68300e67 cx=c_pps a=l7dDOtusiRNhBxiH5QrzSw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8gLI3H-aZtYA:10 a=N9GNhs4bAAAA:8 a=65p1ccFE3Hf02clXqFMA:9 a=CjuIK1q_8ugA:10 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: s3vEMV0kGTTUyWiGkd02E8UROO46y--a
X-Proofpoint-ORIG-GUID: s3vEMV0kGTTUyWiGkd02E8UROO46y--a

Am Thu, May 22, 2025 at 10:09:13PM +0300 schrieb Dmitry Baryshkov:
> On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> > The members of QMI header have to be swapped on big endian platforms. Use
> > __le16 types instead of u16 ones.
> > 
> > Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> > ---
> >  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
> >  drivers/soc/qcom/qmi_interface.c | 6 +++---
> >  include/linux/soc/qcom/qmi.h     | 6 +++---
> >  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> Just out of curiosity, is there a usecase for running QMI helpers on BE
> platforms?

I'm not familiar with modems, but the wireless drivers ath11k and ath12k use the
QMI helpers while transferring the firmware and boardfile to the module. As an
example here is the log by probing ath12k device on big endian without a patch:

    ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
    ath12k_pci 0001:01:00.0: MSI vectors: 1
    ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
    ath12k_pci 0001:01:00.0: FW Ind register request failed, result: 256, err: 512
    ath12k_pci 0001:01:00.0: qmi failed to send FW indication QMI:-22

Similar behavior is seen with ath11k drivers.


Best regards
Alexander Wilhelm

