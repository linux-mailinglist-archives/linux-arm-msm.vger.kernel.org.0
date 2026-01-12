Return-Path: <linux-arm-msm+bounces-88427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C266D10634
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 03:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D897A3014724
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 02:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB7A3054F9;
	Mon, 12 Jan 2026 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nyyCFH8o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="P//VcTxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCE182B7;
	Mon, 12 Jan 2026 02:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768186412; cv=fail; b=CTzh2WCfH4mMo2zIGT0RVnq28GPFtk5+jaSirud38YvP0XUepqM8otq8NknfxmqyVqhzy6jqWmRBBIoc3Q3grHnPxhjZKjtDxwzmjAmfTrvihLw8eL+XkGU4WbdxoXsKwjNQs18noF2auCSK3onn4ZejRyudTCFe9XCSaySkoyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768186412; c=relaxed/simple;
	bh=Wai3PeP51eJq0tPdvLHYsAy8I6o0ql3Ok2ku3TAdnMg=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=bX4XGf/UROCRH4KCBZ85MDhTgllt7AAeoCX4VIp17eC9vjzQQsGb3IDoXpii3V3mY5fvwWhjdd96U16z7YPjpatKRpZpPiTXd9Rx1gHOfB/AqKhwNP4c4udV84uevcqe1jTp/h5mh6+voWX2ZevxkIWN5gGHErMifhu383YtIQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nyyCFH8o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=P//VcTxu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNw6IE790542;
	Mon, 12 Jan 2026 02:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CwHxKP8sDv5NHTTlXR
	lTL29gn/ya5ZS/CV4ojZVhjYI=; b=nyyCFH8oVD6Yo0JG3kyziZC9lhEPeXjnyv
	1B57SyeQAIQRYmrnxYMDN4JpWRZTR4a8z0kw+Xu1ag10AmLC3ftBUkmiCRqc2D7l
	lRwsP5vFnDsYe/kDlPmkXlS3FH6vaR/yCrl7DwerNrdNLUmv1qmq4CnHWeRM+/4A
	vBAxTbTwBM5jzrwNAFCTYRwbuC30ebXGlBg3zx1pHGOVOPBFfffd9ISkIBbBCFGm
	u1Ee/c8erQjbaPj4tWL0ebBUppaYo13ux816umK0Obq0Q77vkqGpH0ZTT4GZrmBz
	v5V9qdBi+v9G1mxURKG/Evt4NWV3/RLYzVw4fla95EtSs6c41cUw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrp8gxxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 02:52:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60BM3dtF004110;
	Mon, 12 Jan 2026 02:52:54 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7gnkty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 02:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlEFmu2k02v/luhA4e1zRgzw/i8fXavpuhzpOkmWifi962FSlTwO6+lyLfk9RHgGeD0lTNUSu7OFUwnQgRnWZRawlFbwOpEqFDA/PdPRPAqx6/nAf4FPo8fPAZg9iJD+4/35sfgygBv+PlOzLhPhBYmLRJx9/8J5NbcI/aTx/UEI++naZkryb2p/dcdcR+UK+HXHUzSYRM6UZEznGAFySrCyo2duP83EOhLDrUzJrmPhWvu00ecPe8tDxJckNfxSShKmpc9LUT4PpjCmLOTMmKW+UdwjnhwgjKmX+pyb3fMZ5RZovnMlI/i8g+QnhZKmTrDl9JogqPrvFmvXGvXnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwHxKP8sDv5NHTTlXRlTL29gn/ya5ZS/CV4ojZVhjYI=;
 b=ZhubR2DCpbtJZKciptYNDYn0HRrceJMrAQkNRL+AK92cGJKs1sbEkXFFy68cVPZaN7CkMrZvDF5M6klDslMoac5ykBu95eKRoB1oRKowba6HbuDbH9QVPVUIc+aTMf2+xL+sm4mDvWGdllH7gpeJOtGsV/r954lu51qb9VN+7EbIBLcIzgc3Ki7dlWvhzjWPb89DRdLTCHlj+c+x6k9TgkwCzL9bFANEEZxUxJUeCTrgZGQlXIjHeU6EL7hl0BDYVZ9S6OR4kpVxHTGY79t3Tf0bGAKP/fICQjSijMGE8icyPqEI2S8OwK7/nos5m54T5IlYPonq97bYkVzCv+InEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwHxKP8sDv5NHTTlXRlTL29gn/ya5ZS/CV4ojZVhjYI=;
 b=P//VcTxuDCJQ5KP7kQA4LFWGn2hHZy28zZpPnOWSXGeTH1PZ5iQSKNS1X1sxkX5xifzUmvLtOEq50xbig7tVdayX6KIZPww5GU54KzwsKj0NiyO/IxqS4lo07nUT1YQSePnKUakCwqiuMSp9xhSMiHxFShOWwBCTZTcipdS5IUA=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH3PR10MB7646.namprd10.prod.outlook.com (2603:10b6:610:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 02:52:50 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 02:52:50 +0000
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
 <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van
 Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil
 Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com> (Luca
	Weiss's message of "Wed, 07 Jan 2026 09:05:55 +0100")
Organization: Oracle Corporation
Message-ID: <yq1a4yj5ysp.fsf@ca-mkp.ca.oracle.com>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
	<20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Date: Sun, 11 Jan 2026 21:52:48 -0500
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::23) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH3PR10MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: db07fd95-8038-49a2-77e3-08de5185ace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/WxVNFHGL7rLZ2ZI+NAQ+kxNrRyg6TiTYk/2p0fvnU0roHT+2IiJdBHJqJR?=
 =?us-ascii?Q?nWf/DJvWsdSxGtDpRGT+LwaBnrOxgTLnpSeiQt8MuUrHjIpK5cjWwG5g3kh0?=
 =?us-ascii?Q?HSXzN/TQbxQO3upPv8J04KoBFIIHJrlcndbJC4x4sEnZNYsPq/3Iv/1qTg+W?=
 =?us-ascii?Q?oPrxHg92a1qHbpQkv5yuttTibI69n/e0oqJz3XebV1XMLDPVs2fpuYQ/sQwm?=
 =?us-ascii?Q?d+2VUsUjIVQj0MJIlQiW4eQBUCLDPqlynQZ02lz1sh+t6hMqZWOkA3XaQ6wW?=
 =?us-ascii?Q?VZJ8yPi19pHwkUW5PwTc3FJGIF5lCewpY/JHe9P3eU+u3SS0BfZmzhRIuhjG?=
 =?us-ascii?Q?J3ObhQBAbrvm9bv5GBE3QHrRXtOZXflIBP7p3TI0B2EJPzwbSvvZH0tD15Wy?=
 =?us-ascii?Q?VDwPTukyadmNQ9AO4+u14HtJiDNBBlRkT0FzsBgua74Mj1wC6MdSyx3Y29gH?=
 =?us-ascii?Q?uC4mj4mv6VGibwhPndDMPRp3EEs3yVmvMa3Dor5OuRB46nuA7NQMqzNSv7W+?=
 =?us-ascii?Q?35V3lEN+SUawqOKANv4dIdEg75b+p/Dde2mWRIGZYiEc8FC6GN1ZqNf/wquE?=
 =?us-ascii?Q?910kJ2X3ZfIJRfzyw/wdKDpc/kcY5pQX8vhkogmBuEgsy7XmeQ6HOT0/ZBJN?=
 =?us-ascii?Q?XaWHwnRU81DSVfE4Pcw0mh7/N8YeLMs6bVXqwXKoKPQhTFoyq8mVAPy8j2rW?=
 =?us-ascii?Q?1zKLNhsv3sn9o1b5zohnKpfj7s8s+1WrZoHWEGnG0CEzYeP/bhUB+ze+LO56?=
 =?us-ascii?Q?YTzBKPTLNTk2D2FVHTc43gJZzhC1BcN+EI0khz16uh0AdXxhwjabakQ2hsKf?=
 =?us-ascii?Q?G2v1lphUBKPUnZ01nYcoFwH+IANbUrUOmjJCWyhoSXwDxZs4LVyX6JPZ1ade?=
 =?us-ascii?Q?sdTbma76b9K/BGaxUaiyZvuhmGXgovD/+LAAsUpFGAuYAnTqaYykrp/tPQrZ?=
 =?us-ascii?Q?E923VN28OEhqo5fDkDQa09W+CzqZoRgnX8jjC6NaJaDEetNKX37Sz6ISjHrh?=
 =?us-ascii?Q?uvsBZebSArKguIFYk+j08XC4fQTXcDmf797uBuxRV8vQEhpRjda9Mtkg/H5W?=
 =?us-ascii?Q?SETrIg3pUlzlT36Vmla0Nu0e3NRoZnU3dZgJUU4GnAg3q0AduwuYSqr8F/S1?=
 =?us-ascii?Q?sjkiLSbu4L8di5JwDwxVB9ID+i22xIb9akdQdWOvqSL/xqWGkBJol8qi5j5M?=
 =?us-ascii?Q?BmQlzjaOryAcdgWmwHguWyqsWxyvqkla1T7TwT6oopi3UYgYuJ3oNM3AIlp8?=
 =?us-ascii?Q?thcnpsxxTT1wgAyRPIDLkCIOvq/u/fL0G/qEnI5rsymgT84eWoeiYhwDKgd/?=
 =?us-ascii?Q?/gMUG2fARxWAWHevo3tlapMPNBkX5JVgyaFicxl1exdqMS6kUBFJHj71r166?=
 =?us-ascii?Q?4oz+E3IbAY/a4S/yYRp0wlIGgFoliF2Z8M0v1ZmXKces+7Lb/WjYz2eXAS5D?=
 =?us-ascii?Q?7MRv1Df+W8/p88qljnAW1C5uNXlMODX3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ieIY1LNuTwUNt2bKlFRp8PA0s3Tnc2JatB9ZBQ3nA2JOEuNbwi+7si07/cjc?=
 =?us-ascii?Q?1b2opy1keizSG0ToDDeFin9I35ztCzKLxavxrnh5rSBepW+RuqAF+Hnbn7EX?=
 =?us-ascii?Q?M4zIGBmKFsCGF/Qy/Qn1YELQNNcwA0S4S0Rn7EhZTkAe381il6yhPIsCJGXq?=
 =?us-ascii?Q?ZXq9LoGRPA1jNrOqSV0WkwkbCUUqeXfegJsXtezrqFKSo2xpocaHJTB8/5AH?=
 =?us-ascii?Q?faPKVfVHyduz9OfqrDqPNPUE82OFpyvPbquPjfITIDrZKZCRbGETwPyZ1bf3?=
 =?us-ascii?Q?byZqu83Wx1EamK7kosgB5/w5IlvexlNkLkxkkJQEhdOHGXsc4big02S9amZm?=
 =?us-ascii?Q?/b39xB4v+PeLoxH36BxjonF9dVscYhaED6vFLsJ/owgSUfLA+LZgg1wgbgVQ?=
 =?us-ascii?Q?Xt0AS5ABfQVNSsN0pzqruAaz+VDPtrAJlrhNGL5c1iRaIcBR/HuqiQ8LjIxk?=
 =?us-ascii?Q?gcTcTV72ZmgDud+7lTH1icvtRFTuwh5B8F4jbnXiEG//9IU6ISy13Hu+8u1o?=
 =?us-ascii?Q?FtXkSFP+MFIXLQLtA9Pdoj17aKhuMbrLo84UgyIOcto3jUUVtMMw78QIuqrr?=
 =?us-ascii?Q?8Ubp5c1SJ7OxspRRRjrcnppFyguswouSehBckV03S9YywjdJxX7rNsG44aQ3?=
 =?us-ascii?Q?MdhcQ7NRrBKu5ILNQnl7x8TPPZy83doCczJ5g3snJ3vGgJzUG42FqDxmt1XF?=
 =?us-ascii?Q?nOUnBpCU4Aq3XJR+2vHqIUorg1k13sKfjKCMxgUfBS+zbCmbS56TysXlsql7?=
 =?us-ascii?Q?V2ymdusAE9A5X0bEdRyb/5l9ZR8CgM1M2xQ9TUJzVDDouT/q7NTIs8bywkQW?=
 =?us-ascii?Q?6m+vzXp7pJ2eJeBlq55i91mszpWWT8QHpWlMk29uWDxK+1td8aw4/NFGUghb?=
 =?us-ascii?Q?j64KBgrYZlJZC0ZW2FAIC/Jjc2JELLQy0lAQkuieOl9rEz8jKQctHEyIoXCB?=
 =?us-ascii?Q?mJTfnL82nDlSZ7zaeGMOfhnyJMAYhEvdL44jCFtXnVb0SYBkU25LrMPxYGk6?=
 =?us-ascii?Q?5k3m4VCiw8zVKlbKNaxoAgGAlo3h9p2RKV1taGnBZ4dussqSb5wvwSnYkdDY?=
 =?us-ascii?Q?wBPO+xvPe5vu2dq+6djoUykpQcMx8brXtGkKq3jxo9U/s9aLDyg25LMrqfem?=
 =?us-ascii?Q?vDxhbvDGBjkdQ1zOehzDN0ZuAQ59gygjvj9eT0OsjPQ9+C3hGo1u/39wu2J+?=
 =?us-ascii?Q?nSxdEDku9sZKGc4+S+S9Kc+syYOgW96zShphmOUV9dieWurduQfjI2/H5JOQ?=
 =?us-ascii?Q?NIO3xl6+cnaqBMkF7gNjZdE5JjBjwgMZAd+JROXYdmUcaJIQOBMe/rM7a9ov?=
 =?us-ascii?Q?5lvkchs2kmTqcmI2G/X1hMrw9OMvMzVWBzfyasjp0NYBZv525m1AgCA11yJ9?=
 =?us-ascii?Q?nVC96BkChnk9Ckq96v13KKEL6IXMg7okxo0emp2CkVlYPeA6VT06wi3Q+1Ql?=
 =?us-ascii?Q?B1eb/K02aVX51uFMaJ6ENZJOwxwcP2HHjtrb8llhRfI+926haZeiFA9+WGw7?=
 =?us-ascii?Q?3LlrxoK7BBSpRUJuQB2sRsgSiyH54W44sXXu7A7NNofiiLymW8L+0DSOeg79?=
 =?us-ascii?Q?OFZATDPtQsLi8h2s6cAAzfPiXTF4ou5WY1SAiERGxlwr2GFXBSbMPsA87TZo?=
 =?us-ascii?Q?lEGlWEfex6yXqv/QLL0QTWtCiWgorPOYU+k767AS/Jl8JELMPNfUi05YlNqM?=
 =?us-ascii?Q?Ux7ilwD2n+2ofxOKU45+97RWtS7g5S/+JNJ61vMJbESAr7v6UX2Llyu5QKls?=
 =?us-ascii?Q?vPAFzlQfvM7w9mOaLfHNhzl0uKymqMw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TW19MOHui5rvMXY7Foh/t1ct4eYVWVyG5XVm6qPdIa2bxPyS4pyq1bcl7VPFLb1mLw2DnbWC0MATAwUL/u0rEh459DDB8NQLk+XuQbPNtuHQ6sDdmfNmio4sWgbTDA9+V4pSfll0CgCJ6VdYgOyzPA3sfOOpRxHWbfdyo3CmLrA65RmOnlRqbgz5wKI49V1hhQtTI4QY5nB/12NXYV7K3A2GJu5Cw/8rcE9z2u46Zbai5D59TO4CzbSgvo+7Al4079cGJ55+/1hxBqnQajN26HQRGAwbMT8DcRHla/ZjAZbePbkN/VQJyrqfHMvh+9pMqX8KetSRFi10t5ZoGBDWPDiiY5a7SeoIhUc1dBtWyL5sPZ2yzJyZanxPDEwdyKxRtdkC5sw7ZqURPhFVzjLgaMlBGmqsvWbloi6F1K9XtSokaI+SwXw3XKskQmDJVY/YWA+ppoeB0TuZM7ZJAGbCdj0lHwdXU0gSZGgJ26NX9RO4KWd7Bxh1tqRiaD52oD9azJa/pL7osO80atpgtLc4CaSjqVFH/guUEeyfBrDqY4dlR+fPj5APMUSCdB+cWnVFi1apFhJtLzs27ukTrcKjJPKu5RJGVJlHknfPeVqOwwY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db07fd95-8038-49a2-77e3-08de5185ace7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 02:52:50.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8h8lzFN5HQbCcPXmqTxwwyHz1ec4fOFRVQ54cfhlSDiSCWTw/WVH8iZyUWxe9A6ZFu0P/fJKTqkAZkTsOg0HVCq8Oz8EeM2LlqiI+PPLnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7646
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=900 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601120022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMyBTYWx0ZWRfX714tLKspXHa4
 RrxjcLsui9c2Fs9wYtugYqVDbEy6nAK13UptbG+W95otnYzVmRL8CIe8uIIPUkhBmpiuHx0AFGy
 29QQkC311zjFye6x6cj3IkN6qAzvEGJ+6gvaBq9gkghzpQXGyjnhkTT0OFOhrwC61rfOHudJfMc
 TL0zBQT8BPO2KGYl2R/p/QUZA9/T/6V2Xgbw+nvpkyKe16IznbHslrrMshvFiVFqdxpqbesElot
 Cu4vav+X7uDi+LJsAFGlUt+NTfLpdTspOXuNZA34GdrF5DgjVLq7eDuvMrNNbmNWAkGGuUyGZvK
 bla+eim6xioQTfcIOpmglCXNILqWvQMnB+nDUcxvcdd1ecMC7ToIeuyRWODzipASI5JdI57MDhq
 s32x44tYUvC/0Bk0InEMOVPCEfNqAi0XF6wCIPb62Gf0ywhyxCtesGjV4rEdx7CY6hn/Vnh+mCP
 mhBa2eOaY6mpMxfcvpNfQzLnmqF6WlLZlrOeTL8o=
X-Authority-Analysis: v=2.4 cv=YcGwJgRf c=1 sm=1 tr=0 ts=69646206 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=rZlzGLE5OxvCu4p9ThIA:9 cc=ntf
 awl=host:12110
X-Proofpoint-GUID: C_Taz6JORzPLUMXZBWC-_M9KSlJoGhz1
X-Proofpoint-ORIG-GUID: C_Taz6JORzPLUMXZBWC-_M9KSlJoGhz1


Hi Luca!

> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.

arch/arm64/boot/dts/qcom/milos.dtsi isn't present in v6.19-rc1 so I am
unable to apply this.

-- 
Martin K. Petersen

