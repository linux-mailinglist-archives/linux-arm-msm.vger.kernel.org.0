Return-Path: <linux-arm-msm+bounces-42117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B1E9F1777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 21:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76427165E1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 20:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BED1917CD;
	Fri, 13 Dec 2024 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cEKOpBii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2042.outbound.protection.outlook.com [40.92.89.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573C175AB;
	Fri, 13 Dec 2024 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734122351; cv=fail; b=H/kCvcS1MDhfayIUoSjxG/TFSDka1iVN5ANX8k6DiHI+Dttk07KRv8v8oDw/wShvShOtv0Vh4J70XSOZvP4u+f/Roa/vo9cEFFsoO1OJmig/syB48v5Ecmmh0yVIIO0HN60xo5Wnos1oeuONy+6X0OVe3ksmBaU1kNCCjGFALxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734122351; c=relaxed/simple;
	bh=2cs2QBHG/a8zQ/w7rQnfe19y59P1yCMMqy9Is8mPKPY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QuAD5qT63A5I285dvJw/7qhsjT1g2ULcDEh9bZDIXVbVVpcunWO2iQZWumeO0eaTOmpA0GY9abZYii660L2efO7rxl1a7WvAN6BO9+EJ2FeE8ex3eUCX4Dah+JXWj3qlZElG7sZZb10+OYuf12fKiFsX6M+p/If8E9ZV52Xjgsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cEKOpBii; arc=fail smtp.client-ip=40.92.89.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch7QwjIzHm5ejuVynlV60jhB1YcY+7O4rikytBl+n8BKnyBIP8+TYnMm7Brw/0H5Q2oWPfl6UAE7dNF9H3ZqDah0LBtfSB1BH8ZM9bXk8slGLgN1Wf+zY67oR2i5rmEhX9/9kPZtYu9lmYz9YEAqqHRHgmF3Gj67o0RVkuNHgOuBc1olyrU8AbTc8P1Wy4l+VSEBYw4o8+K72qw78gTkgXaPRoW3vWLBDDFTEs1sYKyapB6Swc5Qw2TvOFTBdlUpMrD/YENUL+CRHTBj+nh6m2SIXB/FKKvWJLTYeeEZalZCv+r/YBudvZNKD/OZXddiB1RyHhc78LblnHMhq9eodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LswwHOJzRT9hEAItEKqcKTr9TO6qDPQi3qewMByfSyo=;
 b=W1X14LR6widimzcbwsApCG2C7ys1l7i9rftvQ9CMsPSny2mT9pq7N93rkhyyIDaHzG/zEjUq2cE8WnmDi29ttinefmhb44LOg6LVnTkLccWA4ODHdlw5y/mUDEsKb3On+yM2uLuRJdT7hB6SvZL0+EFvBTQCz+5Cnhi6nyaTvM7p2WQbkdB+bd0Nsg4qWum2NvVYApniof/8OfT4G0KZ/zXNrICfG1WpTDVTNWhgvLTKoPIVaEg8TkE52MbY0ZEMfl594AqhQ5qyNhTDa/DcO/JUdNC/ACU3z/njQUl3/bGR7heNluDgCRTvXfnqhDGkIDIow0ug6cE/iKioIqDZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LswwHOJzRT9hEAItEKqcKTr9TO6qDPQi3qewMByfSyo=;
 b=cEKOpBiiFkEmQpET4Laz71Nnj7jyaKagWsuBAJc6uSrkZJROav8ab9nSqAxL30JGnP9BTzTsEoPVpM9C3HldsDNDEdNgCPB6Kr/rJMeG/zAVUEqSDHQ1b5cQGCpnUIN8gL9Nz9aJJHFeT/bvWQL7GK98+s4zI2CYtU1VX5G9n7LA35xXSKWXn79ZPXPa2h7Gh16xJ/bJHwAY/U1p5CcthbdidixZYD0zszLpaFofX9nDSlSWQj50ugkRAv1WbDV6E8E31dUTb7ha8i08RK1SQUj8bZisOpYWFkzkgHDa9vPthhu6T+dBNiycIy34PJNMJ3Qa5vlIo1bszqURcxaZcg==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AM7P189MB1121.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:173::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 20:39:07 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:39:07 +0000
Message-ID:
 <AM7P189MB1009F7FB7D074522E0641BC7E3382@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Fri, 13 Dec 2024 21:39:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB
 QMP PHY supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Marc Zyngier <maz@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20241210-x1e80100-usb-qmp-supply-fix-v1-0-0adda5d30bbd@linaro.org>
 <20241210-x1e80100-usb-qmp-supply-fix-v1-3-0adda5d30bbd@linaro.org>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20241210-x1e80100-usb-qmp-supply-fix-v1-3-0adda5d30bbd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0166.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::35) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID:
 <f2932135-995b-4e68-abf0-5a31413af03e@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AM7P189MB1121:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb0d7d9-6732-46ee-42b1-08dd1bb630da
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|6090799003|19110799003|5072599009|8060799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG1NQndvS2p4VElSMUdETjJTcjdFcXNrY1J0QXVkZTdXSUI5VTNFeEo4OVJE?=
 =?utf-8?B?YzlZS05BWFE2Z0lDTG83RTN4SVhmVUc1QnB1Q3dpZVVTcTM4Uk9TQUUvWGx4?=
 =?utf-8?B?OXBuLzY0MmR4S0JPL2RoakJCTDRYemVNTWkzenNic1RMU2pMUHVLSFJFRlRK?=
 =?utf-8?B?SUh6WnhIeTVZaExPOXhsVUJ4TE4vNUUvVVU0ZTJOQnVlK1dvVXFjQWIwdFNT?=
 =?utf-8?B?d3EvSWRvUkhRTWRnTzdMTWZ6RjdiV2ZVWGpEc2RSTTdFRXNPeWx0UldRSTFK?=
 =?utf-8?B?NVFzaDY3ZFZPUjZMWUhNZlExM1dFUVQ1TjdMMWhKakZCZmlFYTRpdFJHVmdx?=
 =?utf-8?B?Y1VsN2oxbStMOEg4dVNQV1k3akpteVNselhab2JHNmswa2VYUGRMbW82ZTZS?=
 =?utf-8?B?WEJqY1E1WElzWEJiVXhqSnozREc1TnRIWTFIYVJIR21vL2U2dXFkcFRYTnpK?=
 =?utf-8?B?dkl3dkZEUlFML2FnTkZXcDlPcWwxazgvdzJ6Yll2dUZ2VDVUb1dSYTczTlZC?=
 =?utf-8?B?OUJLMUtWa2Jyb2Q1ZVRwY0cvT2JxUzVPa0tmblIrWWUzN3pIK1ZGaWpZaEFE?=
 =?utf-8?B?SStyZXVrM3l0Tm91S2tDb1JYSWZFa01nTjZJNlZCSHpDY1RITERHU0d1WkpV?=
 =?utf-8?B?Zyt0M1I1OEhWMHI5QjdoNG00T3NHNTJqeTZEclhDdVQwUGV4RnBEOWlHSmJT?=
 =?utf-8?B?VXZKNVFtMGc1RHFFM2lLQldyR1pFdVFydUFOY3NSdWVOb2pzL1VTdkRCRy9a?=
 =?utf-8?B?aEZwaHVZd1h1WFE1YlJzQzYyVTgxcGhNNTVWaHMwb0FrMmRucXV5OEJBREN1?=
 =?utf-8?B?YVNzOFBHTDc4enVES21lOUpvamlTazJhZXVDNlJvREMrOGNPS3ZWSUQrbXds?=
 =?utf-8?B?NENCdFMxNlFRR1NpRmVuZHVUcmRQWEFoVXJlanh5QXNIN0ttRGtGVEkvQVNU?=
 =?utf-8?B?ajM3RzdaMlg4d1YwM1B4eVk2cHRZWU5za0Yzb3lTV0hyTk1SbFBhQ0lkWGxv?=
 =?utf-8?B?YUFZblI1S2Y5eW1aUC92MElEL3QvZndlcG5ZRXBxaElvYldoWkMwYWVpZXZa?=
 =?utf-8?B?YkUxUU1zVU13WWlDWEkwT081RFdIMVV0VkZQMWZxbWxBL1BiYXBhWCsxVkRB?=
 =?utf-8?B?c2hSbVduVnlRelVzYllyR3Y5ZHFjNzJ5SEs5dk5WZmhzN2JVaTk0NElFSnQv?=
 =?utf-8?B?VHVVSy9qN2Vsd0krWldsNlIveGhBaE5wSUJRaTBIN0Ztc283VTFoRGlTT2FH?=
 =?utf-8?B?bEkyREs4eTdNbVFBbkRFVmJiVDcxMTVheWkzUUdFWmdhWHN0QUlTOXNpMXFj?=
 =?utf-8?B?Yk5jMWFNMDI2RnVaSXUvbFJVckEvZGlHNUZHZHBmbUZ1eUsxVkw0NlNsRDJ1?=
 =?utf-8?Q?cYe+IkCQOWVzr32FlDNJODA+zVjszAEU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWZHRnh5MUFzMFduelVabnRFVm9zZHJnVW1WVGxVT0hZZytFTVMyOTFRZVhI?=
 =?utf-8?B?elZjbFpzcEFGRHRUVExuTHE1YmxJY2ZzVkFlT0FLc242UkYvOUNkdlVxRm9r?=
 =?utf-8?B?U3BBZ2U5L2N6MXVDTDRXNGpTa3hyT2RrZzNFcEJlWitucGlLdkVOOVFtNVJs?=
 =?utf-8?B?L1lsdnZUTWJuL1BjcEJMWExWaE9vUWIzZTVKdFdGQVd1MTIxd2dNdWNRa1V6?=
 =?utf-8?B?aHFkNGN4UytCN05XS0VNUE9ETHVpanpvUHB2bU9OK0VHT3I4OENwdVU1dXd0?=
 =?utf-8?B?cmhJWjcxcXZ5UGtqSUhzRmlWYmx6a2xUKy95LzQzaExqdFZ6NnpscFU0cWl4?=
 =?utf-8?B?TkhjOVpiVC9rTmEzMFZNSVExTlFDWGgraXljVVYwbC80NFBHSmIvcXVSOTUw?=
 =?utf-8?B?em5tRVdSQnIyblBFU3dmUkdXVFNwZWR1aVhZRHUxaFZNcDVBUmpIOTZhSW1R?=
 =?utf-8?B?NmFpM2dHbWxKU0lkTlJkTHcvbTVvWlVFQmZML20wNm1jeGlvMktFb0hXd1Zr?=
 =?utf-8?B?UUVTRTRocmNCZkNRMkk4NEJINnJQRmlvTGQ3cnpRYXVJTm9nSkhYWU92Nk9h?=
 =?utf-8?B?VjlZK1dpMGdkZk1RVktVa1pVN1JkUzI5bzVnY3EveXozSGx3a3ZGaitsTTdZ?=
 =?utf-8?B?eWVxbDNyMDlhY0IzNmY2WlQrMU0zaElocGdjYnR5NFEvcDZrRkJIcGV3NUhW?=
 =?utf-8?B?K2NGaTU0UEpEd0E3THUwTGMzUXc0TktaY0VkcXlSR3RZMG1ZbnBDY0J1SDZo?=
 =?utf-8?B?citSeExQN3AvL2dkWW9LVm5Bak1RK2FvdU9YcjU0dldFb0YxKzJsV0hUbHZo?=
 =?utf-8?B?YVVUVVRHVjZ4UmlCWlVPeUNac012UHBpUTdwZXg3SG1WZnZnVjVZTS9zM1NX?=
 =?utf-8?B?ZS9KSDRmNzdoU3Y4aHd3aWRraU5Ka2hRM2NQemVUL3B6dEJvYUtDRURLWmtH?=
 =?utf-8?B?a2FIak56T0VSQ3BxYU1lS0wrcGdRRmFMSDFGZ3NBMmZqSU51c1dOUForZ21u?=
 =?utf-8?B?QlJvUm5sbDBjdEw2azBoWHUxMnRiQXIwQlRldXpsUkdIdWhtMWY5UTJaSWxm?=
 =?utf-8?B?WFRZbVBaanZ6M1J2SzFqaXFjdmFjUlR6Mnp3akt3RlRUY3ZEL0NYQ1hoa0d0?=
 =?utf-8?B?OGNWbmxJb0lFN1JLY1drZUc5REZNTkM3UHo5eHF0T2RTT3IyUTRyQ01NNmwz?=
 =?utf-8?B?MERqQnpCSzRMWTQ4MUtBZzhxaElBaEVoaWRwZjZ6NGpIZFRSVWl1ajdlZVhz?=
 =?utf-8?B?SnFZem1WdnZ3VHJIaU45ekFGQUtlenVmb0I3WFdWcXBHNnhHeFZsYk5aMVdy?=
 =?utf-8?B?V0JTRnd0YXA4YnhWUUF5ZTE4SWxtTzdtc2FUcHN5VDl2Nllqcnhqd1FQVVk2?=
 =?utf-8?B?dWt1K3cvWERJSklFRWtGekdRYXQ3b3duRG9ON2dTeEhhSTFLKzd0MFB2dEpX?=
 =?utf-8?B?cXNMbXFOWDFZWmNab3lrYytBV0grZVFTc2FkS0ZTZGZFSzRMN244cjRVZnI4?=
 =?utf-8?B?WnlYVW56bXNpOUd6bzFEMTdsYjZXQUU3ZlhucjZjaWNRSzFJZ01yazEraDBQ?=
 =?utf-8?B?SHF2ekJZMUU5VXRCQW5ySjBBcHhGdlNZN2NDbVV4WWhMNHF0Q3RiWEtvT0xL?=
 =?utf-8?B?UXNramZXZlNOblhjanZxck9IV09qVWZpZVAwalJJZ0RnUGNLbjR5c25STktm?=
 =?utf-8?B?bXVaYVphRFZaSXpjUktNdUlxUFc1SU56bStqcDBTalV4VDRpRlFheG16Q3kx?=
 =?utf-8?Q?IWV+y5Atd/zD0J2b2nnF3I26SE2aJulbZ6xurLz?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb0d7d9-6732-46ee-42b1-08dd1bb630da
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 20:39:07.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1121


On 12/10/24 10:07, Stephan Gerhold wrote:
> On the X1E80100 CRD, &vreg_l3e_1p2 only powers &usb_mp_qmpphy0/1
> (i.e. USBSS_3 and USBSS_4). The QMP PHYs for USB_0, USB_1 and USB_2
> are actually powered by &vreg_l2j_1p2.
>
> Since x1e80100-asus-vivobook-s15 mostly just mirrors the power supplies
> from the x1e80100-crd device tree, assume that the fix also applies here.
>
> Cc: stable@vger.kernel.org
> Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index f25991b887de3fca0092c5f81c881c5d8bd71aac..bcb25782d541f43166229695ea1b83ee7b94a6c8 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -599,7 +599,7 @@ &usb_1_ss0_hsphy {
>   };
>   
>   &usb_1_ss0_qmpphy {
> -	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
>   	vdda-pll-supply = <&vreg_l1j_0p8>;
>   
>   	status = "okay";
> @@ -631,7 +631,7 @@ &usb_1_ss1_hsphy {
>   };
>   
>   &usb_1_ss1_qmpphy {
> -	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
>   	vdda-pll-supply = <&vreg_l2d_0p9>;
>   
>   	status = "okay";
>
I can't really verify with documentation if it is actually correct but 
given the similarities in all these systems I have no reason to assume not.

It doesn't seem to cause any weird errors or anything, so


Tested-by: Maud Spierings <maud_spierings@hotmail.com>

