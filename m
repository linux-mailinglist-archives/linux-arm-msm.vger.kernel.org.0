Return-Path: <linux-arm-msm+bounces-95279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFA/O+n8p2mlnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:35:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BE1FDB1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 10:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5279C3099C64
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15046361DA7;
	Wed,  4 Mar 2026 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFVTiT7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ST3IwBKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA283976A2
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616872; cv=none; b=SkCx8N4+0fx54yu4ctXk9Hzyh7pfGj6Rvmtj1SIUn9MYgofg0aoPD+kC1/pqnQhrW+PTrZAE3/jIabAyWMbPTeabzaUZKWmx7VUhiaRC7Xa/vS6b7Y9diS89uDVymVdEoCQVlJo64by1J5AS5c+0Ke0BhjKEsey7qfXpzLtXKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616872; c=relaxed/simple;
	bh=6qNs5bvMZfHwnPOBKJIFPFz6WDohu397FZ3wycyW/AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bErvnZ6PMA+SMR6qnwk55tyYG8OiTrgZvTiIAE/flPfOzq9jmGuL+qHFrKq9XHdHNfNvHxs0Nq9G3V2O74wbLxfHgH8B10+MfhkHu7csjQRYUgjAYdhwOS3qY7Ng/HkU1f/SHXVZrmqjHqWsJgfewxfPR/r3pR8CbJ+lyTQSLvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFVTiT7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ST3IwBKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249KdH91455840
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 09:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=; b=JFVTiT7lxucAne5+
	vWI+HQTpVk9V3jWmx1PWUucrFvamP0yDOFY034alLz3ZBgzIEfMi0MS4uquN1hh8
	EI7aXuxp6dMz6qO68oU/aQSWUICNJo/sGcNoD0kPndEVtSWs5OCjVP5rcLH80Phg
	ky3wGQTwGMI2mB5E91AT27+H0OF6l0sY8Q3oWToivevSOK2GADQjRFKwWcBWEA11
	9S/eTjbdqGKh/aZMhmaHEf1pdgu2dgjd13zO95DicZf3Ff6fn+rEkPSwwJQABuHd
	scgJ1dbD5faRcuu9tqpogs2bthEi90+/7K8PlySiEJVEWT4ZR/QIh7aqipwVG5tU
	9sDJBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj1801s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:34:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35842aa350fso30122920a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 01:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616866; x=1773221666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=ST3IwBKJDKvkcO4gaVl+vpAsYFg50mI5DyXwrPMrimek0MXmOXbav8fWZPUd7ADrnn
         DrsORj77LHTYdoTf/iZy6BEKEiKj4ChAE6u0v7DmqDaqVwCVbLw6YXlDNf5Ff6Xia/Y1
         +c6mHMjaTVNScS/oiMd/CdtY3ZK7qlxn4fHw+wDawSLwDFVlM8/2d/b5ypHfogC1ixaR
         SPJ6c36Tai9u7oyinCfgM49DA/2wmt6mdj+6mOb6qAYNGPGlP2pq+LsIkJF/BguiJuEE
         pluvtS5z7eZHheHU+agSBln6irE/giYHyn5B7L59reicQhPSC12zeaCyhrAbrq+rV3j6
         mveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616866; x=1773221666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgNePX7ca+FZHnkRpuhdJQZhOY6UQv+RvgcyupQpELQ=;
        b=BgPvjcKGeOijcgH10UsnkTSGoOWjorWdB+ir414WJVRTGr2UitLIn/uAHSuywW27hK
         HeKPiBdSezAz09QOhAS3D9K46ovLFe/qflFp6gd2VD4/ecxh57ey6gt+k7X0XbhPPnV8
         JwmujNUx9tKa4zGp4EMAP+EMLF4i51LU07nBL21170KJB/BUa/BwrgUMvslx9TEdudrJ
         ZWKX5Y634Ez4sAgYPINIHc306adEkr3XwfrZ5xKZ7d4E3poikqELRaMTUaFZtF2O/MyV
         9BXWyVxhWKpY9wlxKfKfccJ+4L7riNi25mszwDf8vHnXtU6W9ouMFWWtd/vqFC471XVn
         WqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWthGj9ekVi+z0m3bvGplrIt4qIucfIAAPxRllTUK30eXqxS/wm43cqTOjK2OY+P9/F5A6nquliZGuk6QiC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5EoTaD4zch2axSY6s62s6yEe3ZI6Q9mlnEv/6T/AoyWry3YXN
	hdBWcqBlMTP6XW5UYZQnV7xn9RHBEH5JwYac37K/IbvoGzPlhrTq/6mSLa10KQfL2jtQ3ADalYY
	0xZN4mT+X1LhPZbtwkzFfrxRqclKSPzGp0qnKQ03YR3g53mLv0yJmgF+KznlaN2we25CD
X-Gm-Gg: ATEYQzywp9DamqZnMISDSM+MkAXRhAFwb1TDig/6VfzmXDVSF+/9wtDjjSl2I+eAO1Z
	xGOJYHu2MzkjR+utM1IV1MqeCF0MxV4oWG7y9onF4b8rqkOerOVNryImWiouaqPpOrer2s3XPcm
	Mx5qSZZFM0DZA+thhOH38dyfj+CLQ/DkFhUEK3KTwcztEbhwl+R6UyukdOyPAbHGE2qbK7hpCQN
	v+j5sdEtM002iqCpsnkJRemMZ8Vla21HO/sB1lhmFW47ipDf/FBZAjTWYAP9dE2vmIvAvWP63U+
	tDrbI+EX8sJT7boyrNcrcWuX9Rk+GSGcHUmnYrxbqqI8hj3JQo9yREaQJ7byh/nsBhw4wtT+YAn
	lhOA8B9bkZoPStoc9+1tfNhJNVX2twt4PHt8RD6I8LUwzFncKhbpb0MJm
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241339a91.5.1772616866190;
        Wed, 04 Mar 2026 01:34:26 -0800 (PST)
X-Received: by 2002:a17:90b:2691:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-359a69c0d3dmr1241312a91.5.1772616865529;
        Wed, 04 Mar 2026 01:34:25 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8d65b31sm500720a91.0.2026.03.04.01.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:34:25 -0800 (PST)
Message-ID: <4bc86c4d-3a4e-4ece-a01f-dce735ee9bd3@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:04:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal
 <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
 <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BfRqgyEKdtBsx78BcTX_PCYt3n_wVY0k
X-Proofpoint-ORIG-GUID: BfRqgyEKdtBsx78BcTX_PCYt3n_wVY0k
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a7fca4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=MLUpyK7X_zb698vRSG8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfX4IW38pWA+Aht
 swT+wU/150J6ACoZu/ofyruKnB+Fgu+cAmUinSOOFqpqPlQMOrokKgnljO9MyiRwThdTJ9v2x7w
 LrLRWHCnIKsTisTIJETiJ5Mstx8T7YTThz75KCgApv158KV/yLVhiRgF4ZfALdzfYjyvYxkVyct
 oiOBGxkikUsz/508ASxK0Qq+q6hL6sFHi0fW3bKZb0DlezDBNMWUSijTilCC6CCWYJ2Y0Ts3p8E
 G3TOkHKiqEosN6XnZQItRNwWXTA4kSoHEMuNcNmgtLSuWyL/FjMwfzadlxxAolDj5/cMuwaC5g9
 EwpKIuuoacdTaDCaJhtvFdmkxhZ2ludW6Nj3MRu+GGFh0c+Zd0TSPnQ8WZ53Q6hmdR9tYaDf3Rt
 jTzbyTaUDQpxLvuKdMZXzEmoG7QBncowCbccWAky4ShuhtUqvlQW6xOK6Bikpr+nJpP7TghXH6I
 mVooEfriF7afjxB3myQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072
X-Rspamd-Queue-Id: 9E6BE1FDB1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	TAGGED_FROM(0.00)[bounces-95279-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,iommu_spec.np:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/1/2026 3:32 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> Change of_map_id() to take a pointer to struct of_phandle_args
>> instead of passing target device node and translated IDs separately.
>> Update all callers accordingly.
>>
>> Subsequent patch will make use of the args_count field in
>> struct of_phandle_args.
>>
>> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> ---
>>  drivers/iommu/of_iommu.c              |  2 +-
>>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>>  drivers/xen/grant-dma-ops.c           |  2 +-
>>  include/linux/of.h                    | 21 +++++++++++++-------
>>  6 files changed, 44 insertions(+), 30 deletions(-)
>>
> 
>> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>>  	}
>>  
>>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>> -		id, target && *target ? *target : NULL);
>> +		id, arg->np ? arg->np : NULL);
> 
> Is it just 'args->np' then? If it's NULL, it's NULL anyway.
> 
Right, will update this.

>>  
>>  	/* Bypasses translation */
>> -	if (id_out)
>> -		*id_out = id;
>> +	arg->args[0] = id;
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(of_map_id);
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index bff8289f804a..74fc603b3f84 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>>  {
>>  	struct device *dev = imx_pcie->pci->dev;
>>  	struct device_node *target;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	u32 sid_i, sid_m;
>>  	int err_i, err_m;
>>  	u32 sid = 0;
>>  
>>  	target = NULL;
>> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
>> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
>> +	if (!err_i) {
>> +		target = iommu_spec.np;
>> +		sid_i = iommu_spec.args[0];
>> +	}
>> +
>>  	if (target) {
>>  		of_node_put(target);
>>  	} else {
>> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
>> index a0937b7b3c4d..e1d4b37d200d 100644
>> --- a/drivers/pci/controller/pcie-apple.c
>> +++ b/drivers/pci/controller/pcie-apple.c
>> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  {
>>  	u32 sid, rid = pci_dev_id(pdev);
>>  	struct apple_pcie_port *port;
>> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>>  	int idx, err;
>>  
>>  	port = apple_pcie_get_port(pdev);
>> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>>  		pci_name(pdev->bus->self), port->idx);
>>  
>> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
>> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>>  	if (err)
>>  		return err;
> 
> of_node_put(iommu_spec.np);
> 

Sure, will add this.

>>  
>> +	sid = iommu_spec.args[0];
>>  	mutex_lock(&port->pcie->lock);
>>  
>>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
>> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
>> index 1b7696b2d762..5f1d6540049a 100644
>> --- a/drivers/xen/grant-dma-ops.c
>> +++ b/drivers/xen/grant-dma-ops.c
>> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>>  		struct pci_dev *pdev = to_pci_dev(dev);
>>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>>  
>> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
>> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>>  			dev_dbg(dev, "Cannot translate ID\n");
>>  			return -ESRCH;
>>  		}
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 824649867810..9d72d76f909d 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>>  
>>  int of_map_id(const struct device_node *np, u32 id,
>>  	       const char *map_name, const char *map_mask_name,
>> -	       struct device_node **target, u32 *id_out);
>> +	       struct of_phandle_args *arg);
>>  
>>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>>  
>> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>>  
>>  static inline int of_map_id(const struct device_node *np, u32 id,
>>  			     const char *map_name, const char *map_mask_name,
>> -			     struct device_node **target, u32 *id_out)
>> +			     struct of_phandle_args *arg)
>>  {
>>  	return -EINVAL;
>>  }
>> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>>  }
>>  
>>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
>> -				  struct device_node **target, u32 *id_out)
>> +				  struct of_phandle_args *arg)
> 
> Document that it's the caller's responsibility to of_node_put() returned
> node. As it can be seen from the previous comment, it's not obvious.
> 

Sure, will add comment regarding this.

>>  {
>> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
>> -			 target, id_out);
>> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>>  }
>>  
>>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>>  				struct device_node **target, u32 *id_out)
> 
> Is there a reason for chaning the of_map_iommu_id() args but not
> of_map_msi_id() args?
> 
 
Thanks for pointing this out. I’ll update the series to keep of_map_iommu_id()
and of_map_msi_id() aligned.

>>  {
>> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
>> -			 target, id_out);
>> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };
> 
> Which driver passes something being worth of storing in .np?
> 

You're right, There is no need to store these input args. Will remove these initializations.

Thanks,
Vijay

>> +	int ret;
>> +
>> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
>> +	if (!ret) {
>> +		*target = msi_spec.np;
>> +		*id_out = msi_spec.args[0];
>> +	}
>> +
>> +	return ret;
>>  }
>>  
>>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
>>
>> -- 
>> 2.34.1
>>
> 

