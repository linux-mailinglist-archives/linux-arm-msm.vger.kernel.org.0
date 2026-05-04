Return-Path: <linux-arm-msm+bounces-105644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIl+OYdF+Gn9rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:06:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C094B92AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37489300E251
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93F329DB6E;
	Mon,  4 May 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7L2ScIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQAOH+j3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C02356D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878399; cv=none; b=i9jU82M1ybnjKpYhUqIVbwt7GA+nwxIZx2g8lCoV17/JP5qq1Mqu4M5qBWvkqmxGDfll5YD711kq28QDC6+kZaW2HNZPQz80YarcOsSQs/Yw1rXTW1D1S88DJEqGYAfvy7EgIFR06tTc64loyWR3lJYjl9PYKTS4XSNsIjG4PSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878399; c=relaxed/simple;
	bh=95gzVVmt+pw2w1ewq3IbkhXHmC7ClllvwdDzT6KAVs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwS206x0x01LQSjBROnMuCfPrXYZouIgUvyFOjzdASmWyLeGNFBKJJjFAUosQsbqNu2PtrB5Yr28mJofvem2tWUOuz+WeLSL4czMxhRCJPjW9UsHr2b39yO7rEC1Thp8Huc3v3TbParoaVC95mCElWLsrtl8mfRbvsxBveZpviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7L2ScIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQAOH+j3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DGoB2200955
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=; b=f7L2ScIlzgUsnpyR
	VfiAY+btzU06ihT9wy6Bci1LzEHY7s61RGfpJ53JPMrFVFHpQVYR0oH/oBskIZ/8
	25xCyzCnD/cRUoXJOeGts5uvW/GmGxo5aUwYCkgiwW38Sjqu6IoUAEETcNX1Hzg9
	1YJw0HrXG/7OYfbWR1rOfgSsgILeAPMSewfoADdhDSt0uklFxOYgokZW5kS1f25K
	n3vybFNrOew5sK58srARoN8cQ8hGiNb153gQ2HCizr5h2IJQmiu8fVE95XDvcpye
	A0DLHw+Vup9CbRNvAB16k+rvDmRWXr64APNXIxpTjx/1wizdOLnB+Oht5LNYFGwG
	Y/leVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1ah7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:06:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3653e382405so775096a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777878396; x=1778483196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=;
        b=VQAOH+j3S5KNAlq2IPA77tRDfC5TWL+kyR5ykIRP2cayFvbl+vcOtGhPvQynjzgJ1B
         Ol6enwWEr3kA/9qqS6TKluwAzLvT68SG7buLiH8CLt7HPGOsOocW21LqQjL2iFu1i30R
         /G1mSewzTjV8Af89AE4teJ3CwIl6jKifaYtZDzMkzH/pRK9X808zHjVUBcVKxVmX4diq
         ITWb/VvmlCiyqPifbRpay+Elzwn0SjSBWCVpMBFWNKBCdoCCePGJLmGAtr/anaU9ZiEm
         /W0igFOsKI33E2nrfrkXYhh2oNXFeZPZRia9JlohCfDanuLGwINVi9fEun7dVy3iDlOx
         t+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878396; x=1778483196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=;
        b=JF6ubz41MeY51KCe922EiUe4QlHJ5vhQg92K6D26Y1GRrAKZdA3stv3/ILdsSs0eA9
         CvQjdPGqLibFuHTEfDLrl8xzMP2zEInf3hVyi7yyL4SgLg0LorUi5hw6doqqcaYlBgww
         ZwKKGIde+hG2Q7t/EQU3tq/iVnp11Sj9yw3+Hwp6bogjQwWN42QiMnNusBtdXP/OAh+C
         OzDw1mLBGUJ1AX3n7JpvenR6Ivm+lmPJhvHtypgXIpa0xUYnxdsnh1+zDIEN+Jr+7WNF
         bcQKe1SI5Je0lt+lBkIIBvaoimR++Ti7Da3RXcfXpt5y1HbkJwv35bKp1Aas0h0a36vr
         ao6A==
X-Forwarded-Encrypted: i=1; AFNElJ/X1pBCX18XjFBy4RMcQV8o3uCWHpf2qJcaawCGHq5oL9ParoyBLuXsBRVIeEHDV5aE/Xjah8hkLfUw7VDP@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3LS3g+OTSPYvhCukcQi3bRrb6V8wj6pe6dRE7G+tFt69geGC
	CWXz9P7kt7K0Uf5RFM1B6NzOZ0Gyabrj/xM/W7HqQ3RIpMMGThObtTHJiMM9uWYHv1IM03UIHVp
	JCjtOLLGrXSidvNyl6VQwQiA+PA4V/KqoFmWJWoToHUue2ajX18aKZW1OHrmasnmxinsB
X-Gm-Gg: AeBDieuMMxkz9mkZUBubrxVLebX/6rNEeUZCOJyLiqGJCbadNaj9GKyc+4SgF/1fGrn
	J9KTHQvdgr7huK53iNcjHgRSVK1jQtwwg8iLBX3J++pgtOY5VqliiZenbmrbF0qvPCWBjrFxR8x
	8phXNiPeRimO/uV72bvJtnJUNyHmaROVtDq8HqLaKW3mm8A3SH39Uc7uAxKSRl9JOZ3lr+zp6YQ
	KfiK05vWBKI5fRzR1m3I6REJk7g1aDBb1S6n3EjEHX8QS71ShHEWn2LTJONnEJupEPuZnGhT1CB
	MhXRPaJagX52d7xBzDMi30fYo5zFtKsSpIk5Lyzki9Ua2od7jdRZoWCEC2Ydq5kOFbUcckp/bdr
	+98VNYlAtkxaRghfJXKY5tNAb+In5avoY6cmmtqBd+rKeImwX9L8Y/QR5zbxEwukkJA==
X-Received: by 2002:a17:90b:35cf:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-3650ce8ef42mr8906527a91.18.1777878396365;
        Mon, 04 May 2026 00:06:36 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-3650ce8ef42mr8906494a91.18.1777878395886;
        Mon, 04 May 2026 00:06:35 -0700 (PDT)
Received: from [10.92.193.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm12883779a91.9.2026.05.04.00.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:06:35 -0700 (PDT)
Message-ID: <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:36:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
 <20260504041407.289464-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260504041407.289464-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NCBTYWx0ZWRfX/aV1dLmzERgT
 Lw2NM3Bp2Fxlwyb6q/4XZ3ZHLg7f4ry2PzwNWASN/n43XbUQkqnc90sZ1ZFvsk0Mp7GPENDA3pE
 FTkncmJSKWutun5NgLpGfVoYc5soO22UVBNwK4pQg1GVarFTER+c4emmcWJ3++MJvmf4xBl1iHD
 qAnCDeATvIwRMjQg7WJxYA7K7CWYDBxmgkEAIIalilTtF8AU/zCjShRqtwRv4lLHSJSqgsbR/Qe
 y5a3SRvDax6a9W4cmtWSBqTIPpPGzx8ejKK1Mu7kWm9OUzZabt1O/8YD1Py9NOPqxC5xcytZpuQ
 DS4ZxMl/hIv+zW7qlypSBd1jvMPENl1CTTWDKCTC5NczCbhHQjvGE8xnUrSZDs1xlZNFaeehybN
 SeTA2u6lSUjgXTS39BGLEzsAjIt5HZHvwq8wmz09UhQThZx6LhmmJ7o3GAxJmGoVtAeV9nLnEkf
 sU2h+I7JT1P6gncM1cg==
X-Proofpoint-GUID: ho-L-iad3uTMoi8Ytpes95Tjy6u80c6U
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f8457d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oJpzRAQ81oZ_FtZBIQYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ho-L-iad3uTMoi8Ytpes95Tjy6u80c6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040074
X-Rspamd-Queue-Id: 91C094B92AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105644-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/4/2026 9:44 AM, Steev Klimaszewski wrote:
> On Sun, May 3, 2026 at 10:37 PM Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> wrote:
>>> v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
>>> and unfortunately, the machine does not seem to get to a point where I can even
>>> get logs from it.  Do you know what I might be missing?  I have *not* attempted
>>> to remove the nvme drive and boot off USB to test it.
>> This series, will not have any impact on the boot, this series comes in to the
>> picture only in case
>> of suspend and resume. can you share your platform details and kernel you are
>> booting with.
> Oddly, it seems to, because if I simply go back to v4, the system boots.  I'm
> using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
> https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v5
> applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other information
> is needed.
Hi Steev,

I made mistake in re basing the code, can you try below and see if that fixes
your issue.
I will send this in next patch series.

--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1327,7 +1327,7 @@ static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct
dw_pcie *pci)
        struct qcom_pcie *pcie = to_qcom_pcie(pci);
        u32 val;

-       if (pcie->cfg->ops->ltssm_enable)
+       if (pcie->cfg->ops->get_ltssm)
                return pcie->cfg->ops->get_ltssm(pcie);
 
- Krishna Chaitanya.
>> - Krishna Chaitanya.
>>> -- steev


