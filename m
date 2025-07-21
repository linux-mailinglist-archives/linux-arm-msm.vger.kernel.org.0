Return-Path: <linux-arm-msm+bounces-65891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E402B0C3CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B171D1AA2FC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 12:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572E02D321A;
	Mon, 21 Jul 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tvIio0ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF829B79B;
	Mon, 21 Jul 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099608; cv=fail; b=VJzTk0aOnjOzKLmRsKxltd/GdRHpMJAkD0vwln9DkDzwKJZWoB1/hgnJvtj8I2vPQrkiEoiBkFwST9hpNhpFu2n8U8WYXUqeXuAu0TbpnBwfG+TYgJcef0kR61cokBjKshJUPeQSCR/n+SkJZdA3qL5kD6U5z7QkRMfBjqhLh+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099608; c=relaxed/simple;
	bh=QIDlPKvC8emrtA7/0++WEcZTxcM90JHrWacuk7n7wiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Bzwk5BXRAUDtQBnp2uWKAgLB/+Rmz/y7KZFqusRWNu8LJOfIxztIqv+eFK6K5Dsq1R3Pserge8bffzUF+itLcOIq1Zktmfd4+hJqZwHFq0/zQKcKCLQk8yvWDoVfsfUUqx7UozmpSYjUOc8O+IlEombNHEYdEzQSMQDvfMnwsCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tvIio0ne; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGPLTKk2LK4bMj+qdTS/tg035YtzREUckrkuoiDetNZm0yLPEYzDlgUKU7U/k1JVDs6MEIPFS2MaNqIHlTQVApHTz+vvjHVT8etvn1TKpLGwOCIUvi+IBOMVWP0hdRJ+9l1JU0udIzptHtCeu/rVXTotSvT1h7fkc5YNhB2/orbxWA6/1Kmt1aTcI90wpsoEmF03QQxV7VlzrU37q+lpLT4tW8lxGYN8ImvhW4ccr/k+Q0SF7fnzDEPB7Mb2Axp18qdZV3lQx1tf+tIqU3YP/zA3dloAXvo2fady3CVo3W99nBbm/AidZdKl58MWtZ/JOxSQWlfb+NvTxc9dwQzxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZxaSYsasePVPq+or89PYyPojIdGtV9eft/sNouGBWg=;
 b=LzQqYmdDje7tdsZ22AefbYLY1Xs/F+rWJZ1p4z6AtRW1mZ5FLSs0+BA8Wd8oVAN3N76Stz76RTkBJzzHmHCSVs3XHURFVW1eaVOGiAwh/4Bi+ueClKcNivez9JE8u7U0dbWzvKfOEzwZXqsrFmAIPkzRt1rWY2o02rcyxF8X1xDd0eq5Wo5RPGCrSbjeA4D8NpxxP9GjPoDTy1oza9GtvBmxlKcZlFAJ5/FDFHfD/mVQIwlr3fvzmMbr3c7+7+IGYf27u+AC69YoLNhSGUP5T4yZohfGBi3H5CvRwlRIANPHX0TmxuWy/LYvw5I3s1vDU0KtW2AH3IGm1SKRsAlJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZxaSYsasePVPq+or89PYyPojIdGtV9eft/sNouGBWg=;
 b=tvIio0neUHGFqD3HVa/o+4YzrmeMlx5XYyvt5DJ93MDCrCYLQeS3YiaQGY0S0gF4Xfx7HQ2AG0Q0TxfN20EsdSY3Ln64B08xKyNq1CfojOAXiQMEicf1x/aWhkYwVF+fHBtgQqWrTK/2y2YVGpdw/hDvhGi4QYzh029WnEsOxMt/X0j3sW90gHdDUnqAr5yR3ydfD+duOH9s4WaUjjyvoEVBl9WqHVQXSNLpzM5sdpjWUQZ0TvGeuFT6/9o0QHAvucm5urJE/BL87E0xWNOrYXOxv6xe8+jKQ6dLOyjrV+9w5G5KcoFcBGrLYEQhhYTmli8ykLN8ntcYjEVUqwDSjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10246.eurprd04.prod.outlook.com (2603:10a6:150:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:06:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 12:06:42 +0000
Date: Mon, 21 Jul 2025 21:17:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,milos-pas: Document
 remoteprocs
Message-ID: <20250721131704.GA27698@nxa18884-linux.ap.freescale.net>
References: <20250709-sm7635-remoteprocs-v3-0-c943be976180@fairphone.com>
 <20250709-sm7635-remoteprocs-v3-1-c943be976180@fairphone.com>
 <20250721064256.GB4844@nxa18884-linux.ap.freescale.net>
 <2d7707cc-0a49-47a6-b222-9032f08bac0c@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d7707cc-0a49-47a6-b222-9032f08bac0c@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA5PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10246:EE_
X-MS-Office365-Filtering-Correlation-Id: a764067a-e436-4423-b66a-08ddc84f0de8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l1TaUhCUm557HuwFeAFSZOMLO13tfC2a+pmbkRc0hEElp2RClGNUkaR70fEC?=
 =?us-ascii?Q?6GdtabtmoNITN9B5tf+M7U7lxx+5BBpk6dGGAFHZTJAjRmqAiouezI0oaNaU?=
 =?us-ascii?Q?mgq3tCnifeVln0OWgvc5b4Xy0lbintEdyusze5AdpxbOQ0kJi9Npd2eUSroY?=
 =?us-ascii?Q?xcdNv/FsZsRzitxeBEpnCv4c0Nq7wNNEBqMTxC9krAUxacnOHCbSENFVm8MY?=
 =?us-ascii?Q?s9UhX4ECv4FEiSEj7+wNabojJGR5gCfWT9CVf6DuXV/wWE0SXh1Gt6YW7V+2?=
 =?us-ascii?Q?lBu/wTXWQlovFz+fdaXIPoeGylBTm98d267PY0NplP2BwT3ze3gSideeqRi6?=
 =?us-ascii?Q?jaCXshWECyTAXCpAuJaYrxoCncrVob8v+3LvLSEZsE3k94qBD2nMKlLFfpt7?=
 =?us-ascii?Q?H8mevB1SyJ/NZoICcy4ovkpFOF8j93B5dqtRouL+PCH0DgkTYdH+9/hCvOff?=
 =?us-ascii?Q?WxvmyF8ZMl0Gnpj13x7vDsPAzydtWGOJlsGUd4esICw/PveuqLHveANeQZf4?=
 =?us-ascii?Q?0GDUT3b0z+xzS8aG8wJmGt/sn2MSEEhaPKIOXGtDBqiAHI+Yg9baDgiy28UO?=
 =?us-ascii?Q?7qQ/KyvRET363hqX9HVla/mSLtov744meawbOXaXjgj7UsqlfeZCIwB4ulqG?=
 =?us-ascii?Q?cZhzOLGabjvoUf+33xTAW9/nT1Q+Lg7HIOf/zD3T52sowaCNkUU3UIceBH1K?=
 =?us-ascii?Q?UbX+hfojyGp+7mGLzEHnFERjzcbrszFOzlUX8TSaHkrkiry/qipp+Vt3Mynd?=
 =?us-ascii?Q?mSgctgEb3pRWzMTR8wuRY9W82rcKm+EhyAKurjqHeeYwJZoVrapB+9xP+73Y?=
 =?us-ascii?Q?qtqBPKVIwXT0T6BcQ3335fZWoH+D6HvWm1VT736OhYUutKj1i+EzDROZayXA?=
 =?us-ascii?Q?k16y37Cg2bEfCvwHryy49e03OWj0bH2R1wS4cydrQKoQCG+/jqV8MaSZr7zu?=
 =?us-ascii?Q?eqcmL7R782hYeJ3iAIaeFq+oiqxUgF2/kE9Yc+6MRrzdOUOwHUE+OEMMIKmd?=
 =?us-ascii?Q?iZaX2vhqrBlc6dc5URg/2jKzx/OpfabNoNqi4j1LFhDOBANIIkwrHzUuiQqm?=
 =?us-ascii?Q?uN0pUHRUIOMPe/SFPFa5DiurvYaiG1MduN3vD2JW+eEAetRS2mffutLT0cLN?=
 =?us-ascii?Q?HgMzNchlh6VCtCaEn7EOjTXhQawofgNX4xcY4baL5W7y10P6L0A5Vo4fQfon?=
 =?us-ascii?Q?VE+rrmmLZY9lq+ivr+WrZOepgEld2tIgK1aeqIzZQkoked4y44bD5h8xCkac?=
 =?us-ascii?Q?/FKDGhn/qaMVryZ/5O7H+ttR7v30Ej73dc0HYtg0t5p9WqGkuCHFt6znyaQu?=
 =?us-ascii?Q?/vAUGZ1C+tcF9Z2mc8gL5BbCnDQd+LrVFCQnXbPNUB5rhe1g5wf2oWU9eBFB?=
 =?us-ascii?Q?fsGYw6slF3JxuMYwozw+OmPrehzAY+uI7LITEqUBEv2+raV+Kdbub1697/oY?=
 =?us-ascii?Q?Ll97AT4XxgEIA8lMn7SzbYmn6HXqkdhverzTYTjHkKVJaR0IlAffqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?muTWT95PVSY0TdYgs8YJiqFzK3p09HAfgH3Mj6oKqJme4ZDHJv3w/jCT8SyY?=
 =?us-ascii?Q?nUlfz30HJG+d5sv6wTed9ZuYtWqH5iYK1UNKKI0ur/8NwGndKiuOWIOz8uED?=
 =?us-ascii?Q?LGVsjiYfrP5ihD8p99tvwxxdBypWOS//nOfftMcAVD/vm2MfZWbci+NuzY2m?=
 =?us-ascii?Q?/lrr7kpyVnV0q5Zvscgqukfc1ECR2yuCGSkOuHvzMOdnjVOChIHxw9AV8RIk?=
 =?us-ascii?Q?WsTmEVUpP+xNA9KoufqU3piSqZ3PjkQhKwORZpB1Fb3fq9Mh8gwEicjBZ+jd?=
 =?us-ascii?Q?Ho0vzdmlWdVWYUTxH+AiWMQ4FPAyASia41QpRzPOLW9xTnGk2E7LRb1jxP6C?=
 =?us-ascii?Q?u91ZQwfch8+i/K+8Jq+cgeejKfaxcyKH55QG5ruHQihLHZ2iee4kRsQw4zUf?=
 =?us-ascii?Q?YtDc2AqO3xMuCyjMfgIjKgVcBjt6DF6+R8XDWVlgZF/pGs/j/z5OeY9WFeVJ?=
 =?us-ascii?Q?XoDaL3p7SHgLnzqWyR4/qrUy7M4M3ypAmTXJwnNCHE57T3eRmE2mGRYoSYpg?=
 =?us-ascii?Q?G0vKX1itCzhyYJWpKVzoqKjKKJlVXD9lYwKW69boNv6XBH4uWKaPXl3jDMJ+?=
 =?us-ascii?Q?SxLgbSo2ackOOITkUNu5OmVpxlI1y1Mz+murUq/t9YefqeOR1a7EYiFe9OFL?=
 =?us-ascii?Q?x4/rb6OD26yktHsXygopkdeSW9G4C/t5yFJWR0l8qO5ekk7T7h+n7DpYxw8+?=
 =?us-ascii?Q?If10h5r6CI3Hj7zg5Cw7JouTjdDxamS0SKzsE2jgO6crxOsJU/8fJrT9EbDo?=
 =?us-ascii?Q?Gwm9KRABYKRgZQd0oSkKAqfidD9bV2AGSzr3yj8Tt+SMR7m6Sw4Qqoe0zByQ?=
 =?us-ascii?Q?Ey8jYDj+E/eL+XE5vjFNAgXOA3wIDtopzFmLcpb1+51j2GbBR2VFu3YI9Nez?=
 =?us-ascii?Q?Ut6HUYGcv7nrH8eGmDPhMXAqHmOs90UNy+ZXL/zOCdyNNbpD3FySRKTeDJPp?=
 =?us-ascii?Q?FbAppcpQo1xsbTD8o1ySsEuvuIAbGGhdux1A39PjPNp1SyVMDA6C6Uvv+q2e?=
 =?us-ascii?Q?De0CVXFQFFGHcGGNMj9ZWBWBWIfos4hUtk2ZlBDWjBltZq3eoHyUaScHAuXk?=
 =?us-ascii?Q?Tri8Me0hVg+LqSEc6sQ9i/V7kJTuzlMoynwe09YyOIHQDvjyk2FKuK1zR40i?=
 =?us-ascii?Q?OOYaUmLpZXfn9Q/MFtN7Aqk00/SwUtLo1HhpVw80SAeaDcaPsS6/n4SY8m5A?=
 =?us-ascii?Q?vDiNm8baAa9ABrJYtiUwTggvoVHmQ/LITS1KCLA0xJtFndTAvw7Vg8lyU+qO?=
 =?us-ascii?Q?qhhLdqzSnjaLmU7aCoT6PVtc7C/3FGou1puVM/+S+zdQMppJQf8UfuCPBmOy?=
 =?us-ascii?Q?bOothV5/ohGx/R1AsWoF0cNNJ1NC6nm1b6ToiuHZAdowWQ1cRyn1c6YXLvwi?=
 =?us-ascii?Q?WB7l6V9XBnmAggYN8i52oZ300KompKOCcfpPlyC18+LfkDG8Mh056RiUBUkk?=
 =?us-ascii?Q?AseiZh+AUfRNXtxcfdaM3E4j6ColuWNqsdAp4kgTzuhnZJxfkCBT+ariQnuc?=
 =?us-ascii?Q?Zf68EjADQHWlfzDC3jcV1ivxbx8PWwUp6Vk/l/9EtlT4jnQ0Gw1t2MSKRoLY?=
 =?us-ascii?Q?j405yhVV463J/yZGT6TWxa0AouUBsPDMezRZPQU9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a764067a-e436-4423-b66a-08ddc84f0de8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:06:42.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Maru7I8byxRCsPwkZSheSDWWz/Dx01nUJKWUiOvrOIrN51hhl5flpKHrufMmlcCTTPm+M4+h6OoAr4ZxEAXfAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10246

On Mon, Jul 21, 2025 at 01:38:59PM +0200, Krzysztof Kozlowski wrote:
>On 21/07/2025 08:42, Peng Fan wrote:
>>> +
>>> +  interrupt-names:
>>> +    minItems: 6
>>> +    maxItems: 6
>> 
>> Ditto.
>> 
>> Do you need to define the list?
>
>
>Did you read the entire binding? It reminds me Frank's comment as well -

I DO.

>instead of actually checking you just ask question which you would find
>answer by yourselves if you really opened the code.

I see there is a list in pas-common with entries listed. So just wonder
here is there a need to list all 6 entries. Not qcom developer, just
go through the list and see what I could do.

Things could be improved if ask language is not welcomed. Or I am
doing something wrong here?

>
>> 
>>> +
>>> +  qcom,qmp:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: Reference to the AOSS side-channel message RAM.
>>> +
>>> +  smd-edge: false
>>> +
>>> +  firmware-name:
>>> +    $ref: /schemas/types.yaml#/definitions/string-array
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Firmware name of the Hexagon core
>>> +      - description: Firmware name of the Hexagon Devicetree
>>> +
>>> +  memory-region:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: Memory region for core Firmware authentication
>>> +      - description: Memory region for Devicetree Firmware authentication
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - memory-region
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,milos-adsp-pas
>>> +            - qcom,milos-cdsp-pas
>>> +    then:
>>> +      properties:
>>> +        memory-region:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +        firmware-name:
>>> +          minItems: 2
>>> +          maxItems: 2
>> 
>> Just keep minItems if maxItems is same value.
>
>
>This is not a correct advice.

Sorry for this. I may need to find out more in dt-schema.

Regards,
Peng

>
>
>Best regards,
>Krzysztof

