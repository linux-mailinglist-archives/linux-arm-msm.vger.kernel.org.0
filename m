Return-Path: <linux-arm-msm+bounces-28411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F8950C19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3C11F21216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872081A01BE;
	Tue, 13 Aug 2024 18:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PuMWSeHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F666A3D;
	Tue, 13 Aug 2024 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723573138; cv=fail; b=eBrLcz7RuhfXLkOAeOzNNw0AqOyYbx3PD4TEuuE+reMxoaggDBmJKIzne6YwKABoBGUSAH1/RpLII+JPsigvhTUtCygt1Hi/8W1uvYlw5ALQSxuE6u56waJ7xYJtOBL4asqNSxxfNKJf7NdBpGrf+rtIi+SK+dAUtM4WkH6TyR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723573138; c=relaxed/simple;
	bh=bPdsgtEHNye8to/+n4U7LwpIuKHWh84CffdgEJYfhz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uO1xkTolygdytU0iQ2YgpEMj3EW1Sl7YlcclL3URRHkSkE47m/zObUCFsJxNRExX4mXLS1LjoS9YsDYOVQ0077ur3iwI9z5XfnzcK89BAWHmddRoadwL3CIEzCMoxgodrQE4kEFfJQnHOaFWoFjKJh/7CHHudbml+og6ucIcEQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PuMWSeHY; arc=fail smtp.client-ip=40.107.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwFQzuRwJb4NaLsZaMRnGa57MlE+AH/xYszHkP5EimjZ1uYTyShxnfJ75jmGoHKiYSG705fYNgA7ahjeAs5/+AI72wiZef7bvAJpNA4PQ0N5HW+4UML70L3Jz9GXrK+IgCZFDpyrJRyopbHSzsVwgz1X4g/Nz6kRl6LrvX2phnd8Q6dLBR5pBXdnLL5sNGCq3dexoxLxTTY92ErnPxQJ0UuLBNRaPknEMGlm3MhKvtEdtXypmo+sUlUUlxxOHstLRBdjOCLvjPR24iEZ9KW3pyhVQt2Zp0faKBTahnN5holWgsY9NKqxRgYAJdmSVqZoAAVi5xQnofzo5QheHagK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDfauXGV88rhUE+wzjiU4T46blKRIlI/fXQfN1lJ3fE=;
 b=bdZMdoXA/N3/NOTabEqhY3QZ6ojkguzkEmtaJ8VS4BYpNoHEmEyqCa8pCsMyha96TMKhsfyeIHXRlFBK0xSRsV5eFLdYZGi3YUMica8I8W1uMhtCymHhUsE6oNKH6VSDIRKHodsiGQr2nksU/WqDt+RLtbom0Sp0mr3ceVEqW2pfpv6hkJmItklHfiBkKCtJaTW5dZLi82Rc7unlZ3pMiMMKip/i5L9nBdGVxkx/czW8eHDJftfda4G8jYT42smBFd7jSg+rBfPxJ4jEY6Fmzohvcpk22PDmqLHziig5WxTT94SuD6M+RjQ58yrdsBQ6A4ZyYQfpw1544rANqqJuVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDfauXGV88rhUE+wzjiU4T46blKRIlI/fXQfN1lJ3fE=;
 b=PuMWSeHYP+XzaCKUATpzbA+B713nUxHVjZUh+lP5mUYhIRFHC2zYPNizx+JSpDp+bipajf4SfCxeiYWTxrfAFVzuom+RAfAcHl8nXi3/gzbhB80GD13ubRf/Ea1Pi9Z49/ecXJH9YWtmVK+MLcrIl2QKyeMjY7o3pjxC9fcPuQr++inAH88oDDA00Zx3BU35jfg/+DYP/cdQ3L14Af89ljqUspu1iDGcvPKlPqHMW2rGvHOXX2UthlQtNBHqNT0m/CyNRCarCOFu9eTWrrdXmVafP3H4BR7TFL4eeHFFFXMFKoh/EWMxKi6J6Ybab/8jPkabK/YoXZkHeLl9CfpgKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8927.eurprd04.prod.outlook.com (2603:10a6:102:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 18:18:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 18:18:52 +0000
Date: Tue, 13 Aug 2024 14:18:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 5/7] usb: dwc3: qcom: Don't reply on drvdata during
 probe
Message-ID: <ZrujhBR01MCs3iYE@lizhi-Precision-Tower-5810>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811-dwc3-refactor-v2-5-91f370d61ad2@quicinc.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 701399ff-0ce7-443a-98cf-08dcbbc462d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5OzCqE+igEKb0qZnsH0faAHIojOEIz39Xzt2FCWuAhVDUFKKkHgE+nHi7Tkp?=
 =?us-ascii?Q?E88+U9JilicXEWSK7hnAR50MAyeTLNgbZkt+mtaJDn2mlzOH+R7/AA6aC7Ez?=
 =?us-ascii?Q?y3DnZi58vJjSmGDJE4JAxLp/p400v+2SzuQyQASkfzIYE0YzwPHiqHGUZGEN?=
 =?us-ascii?Q?CtY9B809GPnxgD2QZOhQnpmtow3uU54TQrcOCmbfROvEu34x02zcfOUK55rb?=
 =?us-ascii?Q?BqO2GWVhEmPzInfHcCLQWBGMAZxdKL5aFWT7pK/igcpwDC+wiffb0mtntN11?=
 =?us-ascii?Q?Ok0O/+VUzTbr714zH13Dc1yCo9nWQtN9nFvcChnNRYjkAskSOxFCQkXe6Or3?=
 =?us-ascii?Q?mDcgsb0lFJRk+fJG4rHrZotwhSgFvhfVNiULHsljzbVlFnpFhv1iZv5ahWQb?=
 =?us-ascii?Q?akZkblMGpVyfu2jaW6/Y9ecPLpIN6E6FfPWgRtyW+J/2VHs3fWwCkdibgYxr?=
 =?us-ascii?Q?KCcPFnmGcQ1OuanuQXjYYi2lTzEPhRrw893qf6f4SqQ3gO4vgiy1Dg48QeWK?=
 =?us-ascii?Q?6es6rd89PuoR810rCzgs895wGplEh6d6uzwSvV15n5opOM/v4ELrXneAV1zN?=
 =?us-ascii?Q?8tiXf4isUf6jW2AsfncHq4UNBPIIg+uiL8RT6bbEILTjeU/koqJPwq1OpWSa?=
 =?us-ascii?Q?PRoIRpvXwhQylibV5QdqZYxtb2xnK/Xt1JONd0tA10ute29SVKet1cjMa7eE?=
 =?us-ascii?Q?GUVQWsyvzqoi4jL0AcBjDDmo9xdrtibzBxPfc1uqV/6TUeRyPUTOp5Boz+V7?=
 =?us-ascii?Q?FwFB+Rl2E9nUVxKJcHIdrJoMv83k7EBAyx8z9eO4Ro7neOk1QkoR4menN5Aj?=
 =?us-ascii?Q?9yHHne/QPKE8mXhAbppBPkQevonIBfAf1GtafQftoSMlJF+v+7yRtWUXdEmn?=
 =?us-ascii?Q?hifk2/xrAURwsG6ZZqz9kBtwnvmYkaFEQVPXhGZSL57wxoTsb6a0sSK7srdX?=
 =?us-ascii?Q?IdUyZpoA2mDXm53MPa4EdQnsbgG0W0UfHKidapzd2NYq5yALA93MQ80jykYN?=
 =?us-ascii?Q?dlS7oxTpjQMUJITvU6LHfeeAcAUxMVll7Hj4C+qZNyH7rG72KdLiyYbTDF4z?=
 =?us-ascii?Q?FGQRkhNJa7ANFYRtzzv0cZCK3ERcg7T7wER5O0SsIf+atVtsumZdmBLa0cj5?=
 =?us-ascii?Q?8gcDZqZWXjQPfV8KocIJUUBSEzMlzEnPlmCHZOHXr1brpm7KZyPj8CgyRyZN?=
 =?us-ascii?Q?0kBAShB9c4pMYnp/rSkquJE3gYDUd9lyly7GcBZgDMXjwwUj9a23p3N+odOA?=
 =?us-ascii?Q?e+JtmsWr+Fz8RX8pJCYuK3nEbGon2U9gXMZ9jFfD86itcPnhYL3hMbSiBCFS?=
 =?us-ascii?Q?KmmeSzPe2ZTiXFU9Ci3ldO8DShFCv9Cu5AOkdCcXIlYCaLEYDe/6sb0/MH2c?=
 =?us-ascii?Q?fFNxyU8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/zTFzuVuZsQX+suqRVxz0EuL5a7vjscjoIE/Xasb0x36g6dBWZ43Ryv1MOpy?=
 =?us-ascii?Q?Db5PB2qNSWeg15dSqST+p+N/+e2RgHkk39SPU5mEmKJz6OmoLMDSf2IJPwMX?=
 =?us-ascii?Q?kdybWjkMGli4mQUp6nxxroi37qv2v9HpVfZPYpG9WIve2VxmGdG9UMjRKdXB?=
 =?us-ascii?Q?1vZHHcSbscHWKjgCbnh33TPsHKIi+yMg7EU9BMeAWGv2JgkDZ4OI5EKKfEZC?=
 =?us-ascii?Q?2YSffvb93UXyKPzCU/MUkNLu6blSsZmlvDzaCc94ofuV2pmX6K+5hVxyq1um?=
 =?us-ascii?Q?mpIiZwr1Y/muMQFLN/w8bhEoTRCkDWJKiytZyw70vXem7eBZihDu4NYxvVXz?=
 =?us-ascii?Q?RAKvKIdflQTe5jH+QQmO/tQ5eJQcHyQascXe0xs9uYbw+Jv6EFBPfsqRHNx0?=
 =?us-ascii?Q?ECqx1mjX2Gdtv0d8/irf+S6ds5rTetadS61BlxkV5UoyQ2nVO/hLuYy+gTsR?=
 =?us-ascii?Q?H1/sB6wQHWy3IeYkgH3emnuJC2wFJT6JeP9BUevLeD2Qc8vOKG49lre9GjuW?=
 =?us-ascii?Q?dVCqKHxWobh2IzA3rR7t+sngSuOgggLVgVSygL0NOR2/VZxiYXTlo39Pqbhy?=
 =?us-ascii?Q?Lt98LTaeXFFxlPHwDv/1L/Kq8x7MF19Vjn/t5M2+79yZGw0DttBgCCtoMfHk?=
 =?us-ascii?Q?W94ViXNVzGR0yDHAWUNQ1AxMnPGuiF9f02J6JMb46Crx9rTMMGGNDRaFZMl4?=
 =?us-ascii?Q?e4Z5SjoF7xO3pc1NvKjBWOkxwbMCa1b3s3m4QAR1xfDyo7oHFbDRssgjARta?=
 =?us-ascii?Q?0hd23NPS3ScLy5DK8hBIjEiCxXFGRd79RZWqy5hhZiSzjGlrSYATCtZD5dXs?=
 =?us-ascii?Q?UIsIkUvQhL2HMotpPNXIjW6saazEv8d3QhW7EXCGiK1ho3lj7BruTBxxb9NM?=
 =?us-ascii?Q?Fs7lE35L0NzBq0tjxQMHEdVu8TXqRHwJXwPofeGQkV9oh10I4rBIevlDNK1C?=
 =?us-ascii?Q?axVN/aVoT4Ko6HuigsEjXvEatJ/7bTg49XRF1GNyQ6ywxnj/Prv20N9XwQMo?=
 =?us-ascii?Q?9UrZEnd0lG8tl4ocCC3OPqarlFyAFWcCrzz0DadLTUeZCUv5tn6IDXeSqCUO?=
 =?us-ascii?Q?0ByMx2xDfaBDeWBidCEVRDvetF7P/jL4cDFMff9dRNvzrH/VfTsycBwR17UQ?=
 =?us-ascii?Q?PGsmvujNqVV0uEyOv+2ikzyRMXrmnrbdRbqUhcAoUdwSyLUw7hzPOgWmY8op?=
 =?us-ascii?Q?gyu4UEfScKBb3G4edO5h78Io6mQrmEqUVmC+rqo1aY7rkWt3bT4so3k+rMma?=
 =?us-ascii?Q?+JArXMU0R+gup6+e5tSDeW6LyuDaL4v0LLUqS+1aNg59oqKyFKFkZkdiRFGV?=
 =?us-ascii?Q?X8Izw6xPbNFLd+rv7FnXofFnuzrevvFnSApSk0qTDZFz5/lSHGyDuVtkkNWl?=
 =?us-ascii?Q?bapcG2TE2IaWOCzYtouzAw+dNIyAg6Dr0bYa+0tgInytFmlYaxSnoyPz0qfO?=
 =?us-ascii?Q?K+dii0Yrk+BXCNJJWIUInqtoZUHYeyxWm7XKUSnUkwF7Yt7U86P76IURR24o?=
 =?us-ascii?Q?5v6GFVOCR4bDWSK4RESfiBU8oCBMFCM6JBO/NjM8tfDYfAXiyO+ymEb7iPZS?=
 =?us-ascii?Q?vd4oeCTE/jF2IunWLfqXscr+0Uj9GMfXOe1hn8Yh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701399ff-0ce7-443a-98cf-08dcbbc462d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 18:18:52.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/fMX8aNv2tHwJiZJYYQuBjQ6Ctp/UZ++hNUKJTwR14e4neuzFYRjmL0Zc2hPWNQWEED3fwQBE522kuiEnftAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8927

On Sun, Aug 11, 2024 at 08:12:02PM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> With the upcoming transition to a model where DWC3 core and glue operate
> on a single struct device the drvdata datatype will change to be owned
> by the core.
>
> The drvdata is however used by the Qualcomm DWC3 glue to pass the qcom
> glue context around before the core is allocated.
>
> Remove this problem, and clean up the code, by passing the dwc3_qcom
> struct around during probe, instead of acquiring it from the drvdata.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 88fb6706a18d..33de03f2d782 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -546,9 +546,10 @@ static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
>  	return ret;
>  }
>
> -static int dwc3_qcom_setup_port_irq(struct platform_device *pdev, int port_index, bool is_multiport)
> +static int dwc3_qcom_setup_port_irq(struct dwc3_qcom *qcom,

If pass "qcom", do you need "pdev"? generaly, qcom should have pdev information.

Frank
> +				    struct platform_device *pdev,
> +				    int port_index, bool is_multiport)
>  {
> -	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>  	const char *irq_name;
>  	int irq;
>  	int ret;
> @@ -633,9 +634,8 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
>  	return DWC3_QCOM_MAX_PORTS;
>  }
>
> -static int dwc3_qcom_setup_irq(struct platform_device *pdev)
> +static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *pdev)
>  {
> -	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>  	bool is_multiport;
>  	int ret;
>  	int i;
> @@ -644,7 +644,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  	is_multiport = (qcom->num_ports > 1);
>
>  	for (i = 0; i < qcom->num_ports; i++) {
> -		ret = dwc3_qcom_setup_port_irq(pdev, i, is_multiport);
> +		ret = dwc3_qcom_setup_port_irq(qcom, pdev, i, is_multiport);
>  		if (ret)
>  			return ret;
>  	}
> @@ -699,9 +699,8 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	return 0;
>  }
>
> -static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> +static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
>  {
> -	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
>  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
>  	struct device		*dev = &pdev->dev;
>  	int			ret;
> @@ -782,7 +781,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		goto clk_disable;
>  	}
>
> -	ret = dwc3_qcom_setup_irq(pdev);
> +	ret = dwc3_qcom_setup_irq(qcom, pdev);
>  	if (ret) {
>  		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
>  		goto clk_disable;
> @@ -797,7 +796,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>
> -	ret = dwc3_qcom_of_register_core(pdev);
> +	ret = dwc3_qcom_of_register_core(qcom, pdev);
>  	if (ret) {
>  		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
>  		goto clk_disable;
>
> --
> 2.45.2
>

