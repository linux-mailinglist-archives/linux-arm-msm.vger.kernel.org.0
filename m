Return-Path: <linux-arm-msm+bounces-50643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D28A56D66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978A33B1EA5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 16:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAFD23BCF1;
	Fri,  7 Mar 2025 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rp6C/TXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDC23A9BA;
	Fri,  7 Mar 2025 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364238; cv=fail; b=DHr3MWB1Bes8GVytehnNi9SrGtaRwLySQIgTcdMNHEhrUVVq21PtFJsz4HuQo5mJy6y16G8EDlzlQ6Kc+fcLU8LMWYAXqrPKwkb+v+9lhPLbfMUuki26KyWoJbvPe0J/E9FBpt3eEZlzdlL+CREnggP+OsDY3OnIdU/7xKbml4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364238; c=relaxed/simple;
	bh=km+yBIctlWmxvbR5OEU+n6mMXBlUcB/bMLizrD8KdLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sReNqF2X1ZPHE4xDPYpYoWeW6q7r5qAAMOMRsadfuwy64PMiO67NCCVLvBatugMbC98pboqZmHriFnhCQPqQSHsULRnj8ZCgiRKqhOwxo1wud0Cc8jA3KA3CUn5Wr8TIewO/C7P2oL87MIx+4Fmgi4SqvTQm+DmUHqf/xVxnyBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rp6C/TXJ; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liUJ0iOOQ0SAhq6lNhqxLa5iNfT8LjIH0Reh757efXlLr21gZszLkCzYslTxAUBCNANqH89P7+GoTf+pDzuvzIO8kwuVEtTUA/CmBpHtn33VUQsWbI8YHak5UHBIsqOlVR5xiTBb7GuhgvDC3Ujf7aC0E1X+dv6UZJr//fwE01n9VYwrzfSGxRnKu0r/A49zi44V4Nabfl8Nafra+/YJNypNlG7fjhfASd35Ey+vyBpFe9lIZcu9kd8IOoa7PKC0PQYKO5TmOcIiW9MSTEDSLI0al91GSD4QSw6aLr7C+x5gI5n8jaZwXfPxafZebyPMLVw7JfpQ+ISN+7/97+g7nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz3q+b9SoLhQzFHsjcJk9yXxrecTV5V09EES9w81Vdk=;
 b=PFQFmUX0T3cs/CnbXX9v0WPkcjgsre5CNo6Lm9boGVIEaRTSpSFNbL+WsxcfFYlMrqCRK/bDfCuXysjYuHEumqToPP5UDfg0qUTakpDBRIw/pQ5wxHlNWit8qzFO3IDwC0eeV3SPAnZ7Btk5sd33aHNzc0jUTgYlLrOGPeiB7s9gqQpJXMuyf526aw9FRae5sVNukKFnBB+Gd+i9/wwrRwwnTfLlli+7+8/9Lu0Vmj35O1MIjvzvYr396ZIN0F4+emgJ3srDstt8d/JkzTOkhdZHHez9BWX9LorCbhX3sGPHCMYP4aPOiikmWsKL8twZNg4UUfSfvBBJZpp5hlc+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz3q+b9SoLhQzFHsjcJk9yXxrecTV5V09EES9w81Vdk=;
 b=Rp6C/TXJQ6YfDUU++QDuhuTdpy2rw8bKUnzbASspcq+qhbc7sYgE6aakTd9vYs/YTNRZy7+zueLnL7dwSG65UZ4PfA4wjsEYQTaFcxEEqbpawYlmlBoAY3TWYGVzAvwPzrswytUsBr5j8L2opuHc1MSV3h+GjzW/QbpPIuSA3aV5bzu/0tmQnWaUXan3lGGRGnd/JGBDrvbYD8DcGDrSS0kd++6AjdCLjBXdwGw47KdA0wlg3R1o3Bbuat6kCRQLgCTJxnoOCMdBStvqhaUkC97D/pMWWfNUYCAEPwPbrNIX+UaYwiYloex+x/j0A2t8es3fvwywl+sD4gQO1NwGyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10366.eurprd04.prod.outlook.com (2603:10a6:102:444::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 16:17:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 16:17:13 +0000
Date: Fri, 7 Mar 2025 11:17:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Message-ID: <Z8scADVM/g/669Uz@lizhi-Precision-Tower-5810>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
 <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
 <20250305003148.mahxupphkaiizpbh@synopsys.com>
 <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o4n7p5b5zlgstmkn5hbvdqfe4tkhwidgvtqmcfwtr5yhrvix24@an7xdurug6mm>
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10366:EE_
X-MS-Office365-Filtering-Correlation-Id: 840345f4-63cc-4eb2-b92e-08dd5d938507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YMNvYdUe23T9+Cf0c9ykizepWfdzBQTH7j72fBke1mFKTlyvY0GzCfB5w6cQ?=
 =?us-ascii?Q?/F4aUuEgXGwr25hvxzqVh8da3pyVRrDtwAn8FaxXLft6dvVkeccL8hwlhL9q?=
 =?us-ascii?Q?VuLeDWLbttIdmv1UygxJcAJK8traGySDhqB9D+iK7nKZ+Cga1XrfHy11qc+h?=
 =?us-ascii?Q?WU0P6DDjHwQuzdxkFZKM6/20WeGMOvB4vcvw3e48h683AJ7F86zA87Gj5KmA?=
 =?us-ascii?Q?JKcE+f2eh/zutrTubboaNvshryQQUsiGteo9VKbrR4A4PZnav7ROVFQ0EmZW?=
 =?us-ascii?Q?9mbJ58olOzCEJG1o/eyB6CfElXaeHlpc4F9v96TQpAni9MrSIH4w0yWLheTL?=
 =?us-ascii?Q?dLjPYi8kUI3jxDjNt6PW7aWN+VH95ZxvYOrUkGLlBLKljUHKEbINo6hP9eK1?=
 =?us-ascii?Q?EzndMgby4HCnlQLoQXR5jAmhdF1tHSwxW9CKjsrhv9mmlWoZaFUb9pBFTUNr?=
 =?us-ascii?Q?DcgjK3Vs3NMQPEkehR4EzwcbhrF53ZjUBSKY+unRb/9aisOYbuIyStMdcYIe?=
 =?us-ascii?Q?knysGHnpPRToMblEeFLYouhf4xfCusx0fkeG5xUNfw1Fi3n/fMdNBClfP8Vq?=
 =?us-ascii?Q?lra43iGdHZd47e312luEZZF25BTvjarKy6IxxCPo23zZN2zAXfcKHYiqyluJ?=
 =?us-ascii?Q?1QtWlHyUTfBh4BBICigHq7KbAaxR2+efZBaa2mh04XY4KUJCyC8OaU/qN/kH?=
 =?us-ascii?Q?kwuX4p2irlNRXod9B5FVwNwY764inR0BHgCqZHkk1V+kP6apKvf4rK+grA3Y?=
 =?us-ascii?Q?1s4Mk2sOi+ZNDTs7ZqO7IrSIb6RQCNDhpNVyBh7B/lCDt1dg8jeBnuzEHPCR?=
 =?us-ascii?Q?IU/QM81L+VcrgvRYvaRYphCTQ8pTFQYmzru526p3DLTewiCljr9uSKC4qbka?=
 =?us-ascii?Q?chWZdQaMPIE9B233kYdVRv2XuHYPRW2DFMgNw4o5DTitLKs2rx9m8DAwuWyU?=
 =?us-ascii?Q?guie58n3i56WB1KMlN0Wg6UsEcgqVlCD3LKpSNBpQoc++QVwjrWIdTCu4Hup?=
 =?us-ascii?Q?Kswia5lQQv+7o9s3ePTSOpTPp6W31dKGzVTQBE5S2WzQoj8IJpTka57v9AS5?=
 =?us-ascii?Q?uqLrLcCaXyUNNeb8W4XLx8LDWX1pJ4c06Fp7/yBH2tRbNt7KnzEJrIRBrazp?=
 =?us-ascii?Q?1JvHGdmkDJkwPHFGXl33VmFVZWuA89y2erP+UamviM5LKIi/WVYgveHqvZqT?=
 =?us-ascii?Q?RCdyb7uWZe9bYUuDz23Y84hoDn11QmIKJT3GahehzVOwzfbZMR1SPWMaT1/e?=
 =?us-ascii?Q?xg7Cg831iGY4XNliProZGuDQFLtXHsCD/ZrkhHr/Wl/d/wjO7ckz82jq5UHI?=
 =?us-ascii?Q?3umNioy2uViJTGMIlM/DHVMcTCbNVYzPxK900I7OBtw4X/8WizKVs93qIvpt?=
 =?us-ascii?Q?vau27K1EXdMPSIZljtxNWEaeYAdgbUhlS7vJ+0WRMckS5ZTjG7ntxJ4LC1nt?=
 =?us-ascii?Q?1q9YCLbaid6yedBeV2SO0osW3yVVPDh3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?myQ/dx2reyKT1w2fbRDhljnFgUs1TG0fyBN6eAOsO0y5brRV7pOInWzMrjU+?=
 =?us-ascii?Q?+2sb8CAY038LoxIlRCNr/tBgr+7yZ5jxoMj+MIqbFKnL3PNYsw+tu0HSEc1N?=
 =?us-ascii?Q?CPpKI8Sjt8ooRuXkVTAHN9gPviTMRY7OoXIK6FpsH0F4EK2F4yWK+mTnOqd0?=
 =?us-ascii?Q?484Qu6ECjaUAxzn7jf1wauRvE1lBkVL8EqkpXaj708ZynGRJmSJH2LuAc6c1?=
 =?us-ascii?Q?Z+T9m6IVF/tcDCdMaEPIPp3dJePSUP95MQy1OvxUQ8dXtDpYOOjSi91dqgIs?=
 =?us-ascii?Q?+ItPB7B4cECF8xd6+B6nz0lv3lhb33x663hKQ8jAGVTk3OGKvKogzjgWABo+?=
 =?us-ascii?Q?2xq+DgqzS4lyHqsr7yGqgGu/OkTNiIJtsleojwJNEvTHZHU1kGoM9d0J7gyh?=
 =?us-ascii?Q?9W6EQ+43KUnK8AZ0zoYrtNXtKRYptDjrlBkG3gHWQNDgb/8SedBWInbiPdbz?=
 =?us-ascii?Q?+m6k8RGq1TfVrV5zC1QBQlH1d6ZHK9qaT21sMFvKKBmncneiit8J+BmPR+Th?=
 =?us-ascii?Q?aY/wJoswJdy0+iFlOBkzLgjfXEoVRl+9AasoCNYG1jRhQ9iK15OZjxP8Uwh2?=
 =?us-ascii?Q?tybQCQXdRbt1cmaivmzMOXqqLTB1Kf+ZbmGBYNlj8uc/1gfpOmUE4Uaw3lMw?=
 =?us-ascii?Q?Y4g/1H3VaohfQt2vOiGf7NqI4XkqwnHjoyqn8suIa4WBiVL5A33q3zHwMxkb?=
 =?us-ascii?Q?zjksk0LVb7x7oo7D4mxqF+WjWv0QnwmvAJz+i2Ae0D8kAjEKXA1CqlWBd3MK?=
 =?us-ascii?Q?sglYV3Rp3dXTd/ah7nTWF4IHx5RcVtZbCdAdgENZMS8YkZsr6MLXoSmQJ9dk?=
 =?us-ascii?Q?kOWad+0nFDm21SDSXaGGafEkXp0BHvzVlOJTyxdxU46Qr/WgC2egbZTD0zbS?=
 =?us-ascii?Q?rbPucn8lFYm3clNBKCHrlxGN/ReCYLeiVNKvHlPGLDxX8mNJM0jsP93s7RLb?=
 =?us-ascii?Q?kUA+adWy4+NTTSTo2eXwzTAZ9D30kXmQnYB7/K4vJVhHNmxww7AiiIXqrCmx?=
 =?us-ascii?Q?DPuDeTbgh9iIzNDIcoT9DUNDDRUQcxH4ripiwSjmdIrmTIa6ZZttJXZFKVpi?=
 =?us-ascii?Q?5GJo8QBKUO69uKHw8VOxp+7yQVAihgxkfpgHpavZczz5PiKlYvzot4QaWCbx?=
 =?us-ascii?Q?Z08zobXy8G0y+87BwNpD6wg4WtxhlXjpJL5ATO5pHrWMlH2gDrGQ6Ha1GZkB?=
 =?us-ascii?Q?oqPevOoa3yV+LcQRqI/BUqNY00kXwQQjUoNME4iiHRy90qcRhxQ2QCnmVt3X?=
 =?us-ascii?Q?vt2hCkgtZkbUZQwQjeK8P7WMbi5eHbAOSAPdAEIE7ayHuz/l62N2cx7KihhU?=
 =?us-ascii?Q?OACqw9pwe9xZO2Ka9XlS0+LYYS2ThUpoeIyOD7oIJGp22hQ96JHkj9T16Jgj?=
 =?us-ascii?Q?YL6BGcPF3eC0bbtxQ5pHXLoUsAvpoUAsytXR1xr87XO7ZUDm12y08HfNuKO9?=
 =?us-ascii?Q?MEaXMLUyRZrNRvJJHwjN6mYDAN6a9je4BxpW5eC1dnicL4ur8NoShEay9hUG?=
 =?us-ascii?Q?PtxnFtcmFw26xhR12Mvg4pqGvJgqqotPX68yCXZehTMw8ei0TzZPQpM+Q/cU?=
 =?us-ascii?Q?Q3W3pLKsPXEMlCSQame6IrEUbHhxmO5jkPBp/E8r?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840345f4-63cc-4eb2-b92e-08dd5d938507
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:17:13.3358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYNUDR8MuBtYTI75plG3LlVPIgSQuZX0SN6BYEXtNZ791RQwAjvBryariZj11gscqqZcney09bBdCU1xpfDDbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10366

On Thu, Mar 06, 2025 at 04:49:28PM -0600, Bjorn Andersson wrote:
> On Wed, Mar 05, 2025 at 12:31:49AM +0000, Thinh Nguyen wrote:
> > On Mon, Mar 03, 2025, Bjorn Andersson wrote:
> > > On Tue, Mar 04, 2025 at 12:39:12AM +0000, Thinh Nguyen wrote:
> > > > On Tue, Mar 04, 2025, Thinh Nguyen wrote:
> > > > > On Wed, Feb 26, 2025, Bjorn Andersson wrote:
> > > > > > In order to more tightly integrate the Qualcomm glue driver with the
> > > > > > dwc3 core the driver is redesigned to avoid splitting the implementation
> > > > > > using the driver model. But due to the strong coupling to the Devicetree
> > > > > > binding needs to be updated as well.
> > > > > >
> > > > > > Various ways to provide backwards compatibility with existing Devicetree
> > > > > > blobs has been explored, but migrating the Devicetree information
> > > > > > between the old and the new binding is non-trivial.
> > > > > >
> > > > > > For the vast majority of boards out there, the kernel and Devicetree are
> > > > > > generated and handled together, which in practice means that backwards
> > > > > > compatibility needs to be managed across about 1 kernel release.
> > > > > >
> > > > > > For some though, such as the various Snapdragon laptops, the Devicetree
> > > > > > blobs live a life separate of the kernel. In each one of these, with the
> > > > > > continued extension of new features, it's recommended that users would
> > > > > > upgrade their Devicetree somewhat frequently.
> > > > > >
> > > > > > With this in mind, simply carrying a snapshot/copy of the current driver
> > > > > > is simpler than creating and maintaining the migration code.
> > > > > >
> > > > > > The driver is kept under the same Kconfig option, to ensure that Linux
> > > > > > distributions doesn't drop USB support on these platforms.
> > > > > >
> > > > > > The driver, which is going to be refactored to handle the newly
> > > > > > introduced qcom,snps-dwc3 compatible, is updated to temporarily not
> > > > > > match against any compatible.
> > > > > >
> > > > > > This driver should be removed after 2 LTS releases.
> > > > > >
> > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/usb/dwc3/Makefile           |   1 +
> > > > > >  drivers/usb/dwc3/dwc3-qcom-legacy.c | 934 ++++++++++++++++++++++++++++++++++++
> > > > > >  drivers/usb/dwc3/dwc3-qcom.c        |   1 -
> > > > > >  3 files changed, 935 insertions(+), 1 deletion(-)
> > > > > >
> > > > >
> > > > > This is a bit concerning if there's no matching compatible string. ie.
> > > > > we don't have user for the new driver without downstream dependencies
> > > > > (or some workaround in the driver binding).
> > > >
> > > > Ignore the comment above, I missed the "temporarily" in your log
> > > > above. However, the comment below still stands.
> > > >
> > > > >
> > > > > While I understand the intention, I'm afraid we may have to support and
> > > > > maintain this much longer than the proposed 2 LTS releases (as seen with
> > > > > anything tagged with "legacy" in the upstream kernel).
> > >
> > > There are no products shipping today using dwc3-qcom where Devicetree is
> > > considered firmware. The primary audience for a longer transition is
> > > users of the various laptops with Qualcomm-chip in them. But given the
> > > rapid development in a variety of functional areas, these users will be
> > > highly compelled to update their DTBs within 2 years.
> > >
> > > The other obvious user group is to make sure us upstream developers
> > > don't loose USB when things get out of sync.
> > >
> > >
> > > That said, if the model defined here is to be followed in other cases
> > > (or my other vendors) where Devicetree is treated as firmware, your
> > > concerns are valid - and it might be worth taking the cost of managing
> > > the live-migration code.
> > >
> > > > > If possible, I'd
> > > > > prefer the complications of maintenance of the migration code be handled
> > > > > downstream.
> > > > >
> > >
> > > I'm sorry, but here it sounds like you're saying that you don't want any
> > > migration code upstream at all? This is not possible, as this will break
> > > USB for developers and users short term. We can of course discuss the 2
> > > LTS though, if you want a shorter life span for this migration.
> > >
> >
> > My first concern is now we have a legacy driver that should not be
> > continued to be developed while we also need to address any
> > regression/fixes found in the future from the legacy driver. While I
> > would encourage users to start migrating to the new driver, I won't
> > reject fixes to the legacy driver either. In the next 2 years+, my
> > other concern is that I'm not confident that we can easily remove the
> > legacy driver and the DTS then.
> >
>
> The problem at hand is that the driver _needs_ a bunch of work.
> Role-switching only works sometimes, extcon is (for older platforms)
> duplicated in both glue and core - with the hope that each part does its
> thing in a suitable fashion, the layering violations can trigger
> NULL-pointer dereferences or use-after-free, PM runtime is marked
> forbidden...
>
> We've looked at these problems for a few years now, without coming up
> with any solution to address these issues within the current design.
>
> Following this refactor, we will be able to work on these improvements.
> For this to happen, I intend to transition all the
> arch/*/boot/dts/qcom/* platforms to the new binding as soon as possible.
>
>
> Looking ahead, when we hit the point of deprecating the dwc3-qcom-legacy
> driver:
>
> The upstream-based product we have today do ship Devicetree in
> combination with the kernel, so they would upgrade both together and get
> the new driver.
>
> The other group would be kernel developers, enthusiasts, specific users
> who for some reason is upgrading their kernel but not their Devicetree.
> These users will want the new features and stability we're bringing.
>
> > Code can break, and that's not unexpected. If 2 LTS releases later and
> > we remove the dwc3-qcom-legacy, things can break then too. This may just
> > as be painful if we need fixes to the legacy driver due to some previous
> > regression. Also, I'm sure your team did a fair share of testing the new
> > driver right? Is there some major concern in the new driver that we
> > haven't addressed?
> >
>
> The new and old drivers are mostly identical at this point, and expected
> to diverge from here.
>
> The one thing I have identified to differ is that the "legacy" driver
> supports 2 extcon handles in the glue, but this is not considered
> acceptable by the binding so I haven't found anyone actually exercising
> this code path - then again extcon and usb_role_switch is one of the
> things this enables us to clean up.
>
>
> That said, while this model seems suitable for Qualcomm, due to the
> current state of things, I don't know if the same is true for Frank Li,
> perhaps NXP has a broader user base and need the migration logic.

So far, we use only one extcon.

Frank
>
> > >
> > > In my view, setting a flag date when the dwc3-qcom-legacy.c will be
> > > removed will provide upstream users a transition period, at a very low
> > > additional cost (934 lines of already tested code). If someone
> > > downstream after that flag date wants to retain support for qcom,dwc3
> > > they can just revert the removal of dwc3-qcom-legacy.c.
> >
> > The same can be said that they can revert the update (or apply fixes)
> > should they found issue with the new change.
> >
>
> We're changing the Devicetree binding, which gives us two problems:
> 1) Devicetree source code and DWC3 driver code are merged through
> different trees.
>
> 2) The compiled Devicetree (.dtb) and kernel image are in some cases
> separate software deliverables.
>
> So we absolutely need some migration mechanism to not just break USB for
> everyone for the coming 1-2 releases - at least.
>
> That said, the "2 LTS" is completely arbitrary. If you prefer to limit
> that, we can certainly have that discussion! E.g. I wouldn't argue
> against setting the flag-date by the end of this year.
>
> > >
> > > The alternative is that I try to get the migration code suggested in v3
> > > to a state where it can be merged (right now it's 6x larger) and then
> > > keep investing indefinitely in making sure it's not bit-rotting
> > > (although Rob Herring did request a flag date of the migration code in
> > > v3 as well...).
> > >
> >
> > All that said, if you believe that this transition will be quite
> > disruptive without preserving the legacy driver/dts, then we will do so.
> >
>
> We absolutely need a transition period, per above reasons. The length of
> it is an open question.
>
> > Can I request that you make this snapshot as one of the first patches in
> > the series so reverts/git-blames can easily be traced?
> >
>
> Absolutely.
>
> > BR,
> > Thinh
> >
> > Side question: for Snapdragon laptops, without the corresponding kernel
> > and DTS updates, don't things break easily?
>
> It certainly happens, but maintaining backwards compatibility is
> something we're striving for. As the Devicetree bindings mature, the
> easier this is though.
>
> One example where this is a problem will be clear here, that users
> attempting to boot today's kernel with tomorrows Devicetree blobs will
> not get USB - because today's kernel doesn't know how to make of the
> information in that description.
>
> This is true for any hardware or firmware interface though, so there's
> only so much one can do about that (and whatever that is, we're trying
> to do - for the sake of user friendliness).
>
> Regards,
> Bjorn

