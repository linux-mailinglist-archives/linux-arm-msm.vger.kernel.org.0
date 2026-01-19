Return-Path: <linux-arm-msm+bounces-89717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF5CD3B2C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6977D319C25D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCCB327BE4;
	Mon, 19 Jan 2026 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coEDHFhk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLt+E3EY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDC326944
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841069; cv=none; b=MWtwLUVAQ/T7Qz2ZAzFDwpuV5tIhB1PIZpsRzWJ/02Jz6Xna78Psb5/ZUT88RftpVEhfnfW5Y1ddYzvni00nVjBYg1QiD9SjQFLi6FV5S60XOnggJiMUwfmBymn2PcIObYXBYc2IKQNrbcEX1UBEh8yIc6CCjO3D0b3wMpl+5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841069; c=relaxed/simple;
	bh=hQh4fIsCDYmrRg7mPuWmgi+UW32uqQuv6ldjgP9Eh28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUCNIW0PDTKll/75h5dwfkE0nAaTdXqWE9HRpCzIxMWV5GUAQ2iYIj7Bh0xGlah4v7vFLieu70pU2qrCbBgemr3FRaL2kquSET9b01DVODb/cLKgKNVfJ6U+kPo4ARo+7heDErRFUm6o7USFDa/1gHUa/zZaw9JUSlnsb1sJddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coEDHFhk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLt+E3EY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JDd5Yk1347301
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wmVSL0yeT+KvD+vmMkTMN5P2
	TsIbV9a8ttJOjy1cS/U=; b=coEDHFhkNOmgoVBlhWI3pnsdLh8wyuzTLnTYtood
	rR+jvY5OYGHvzyTW1/Jl47yUZ9hp5T7gaYWyZ0jRxbEkQLE2A0bzU3ZdGq7N111C
	UQzN9QL9kcHCGbn3MWpQLTyp0qlRi3aP3kOB4zQ8vNT39RK6SjIBWxegDNwHdYLT
	fOvDocDhhqM/XaY4Ulcze8PjInn/JsbYvhVa1iudRzLbehIgXpCSV4E5tkjxlGCp
	yGdRUmpTYSchsH7F5sgeHBS3RNOpsz3vasKD9aw3iUZC8YvqDai+TtF1D6rQoGc6
	lOBUpbacnABqsVuTCFYts8CV2/EntsDhO9EWpH3NMMJNEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdggk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:44:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3929171bso95622416d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768841067; x=1769445867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wmVSL0yeT+KvD+vmMkTMN5P2TsIbV9a8ttJOjy1cS/U=;
        b=XLt+E3EYrN/lGf4z6OPaXjP/DqTlITtzYE5BMRA8GkSXb45Ok9zEIOaa5CNbO6Rl4o
         YKAVnuyevh4tENwWv2UUPqNbKQMoEMxHdxUZau3hZqFe+TBm+jCsBHl2V2pIZ2tWJoxa
         xU0x7scYRDGmb5wu7Pnby7RTKVIfb43/1IL+TBaJyBGMphuUQE0blGGZV3g6ic+HcDqs
         uUHmcmP/kOcpfWqvhE6zwahalyx+w5nJ4rSJ6dsp7MxBOWDgYh8Z87jpApEU2+evNidw
         r7YD0psnekFMmkuMPnXNRP5hc1JBsSMjPTmWNbsYoIKDv9mvs0/TlGImVnCB0o+11CDV
         ANiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841067; x=1769445867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmVSL0yeT+KvD+vmMkTMN5P2TsIbV9a8ttJOjy1cS/U=;
        b=kRRUvcnGh+VeBY91NslbNFSxVUnCV+ATUaqK8WyXhLEnKMEsbV0MbAjCMMdMDSfYXP
         aYy2Vg+qG4bYP8TAe6TrVhLQsU97+cuusnBt9a1jala0rbHc8rEZl3MhNziRP2rKEJ8b
         kA06sUKAVOh9BQ5tLKqO9066f4KE+Z12j71cf57G9DC+clG9ECsQ6Hu0whvzbyE1Hw+q
         ipJiosnTzpllJjqeF3mZuhxzja2r4q6QGKUvbPHXC1lWaA9/CqYuerGLb545kII1SYwf
         bp5DUS03gfSXgWwoBr0sJphn3lVKBysNS0g+Nb7ZLeIokvTp6sSm4lmG2NoFl1vbkuv/
         QBZg==
X-Forwarded-Encrypted: i=1; AJvYcCWpdmF2aSiElT9PyZHXH1Izai19tZpQ6seCw/vYb/QzBbusjQmsxB0l0qBlXCGzFFnzD9PaRyIisa8ZV6zP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7hYGhwM2RFsKb1A1zwXPBjzebEcYi1Qgwpr5YpcVdnXObOcZ/
	NV/TvslUWh9MQWUapYr0zVaslXxsEFkOgc0TvTAXfUnksX5pAD3L7uNGAygkiq7PL5Cn7gZfgXD
	M0nylevTqS1W+MwUtS1Bhg4UtPbFt4Mu1jdiuM7qybWzRMFA37QoB943m3qRuBtyjG7A1VXXLCP
	ff1y0=
X-Gm-Gg: AZuq6aJYTN/ZGLG9zFuuvcQJRqHnVp1g2Q7lke9cS3M8eVwvxXbt1Y26/Wedswf1UVZ
	vqGTz/PUH5vbxrgO72M3IFhEGh4n9RTnd/frKhscU9zLYT2Jio/kplf2PF8uKF+biw5EZd9Yy7S
	rxWqA164NWi9mU7aixqOpS8gp318LL76PO0aNvio6DCog8D3w+axTjmDs0uTkz6PxHde10isVhg
	7d0d+3HlLa7VfP+le9TjIwAaKPwvQLTUelfa2yYMOO/+gPFNZor4XAHyNs62+kfsATLWHc9kmZL
	/re0W3chzc0OzvKcpw1bhb6jq65JQW8JaoYkKRv/l2eyV/j8uEyuzqAfpTNXHlonp+KwlB+gdYy
	5FW1Bumb7hLnACRnWwtbrLUD/2TzOCwSkJZzgLYpq+HwNY7foPG8vu6STUcY3j0S7wWfxDCuZKX
	3E719xW1KnuEer5uw/LQwp6W4=
X-Received: by 2002:ad4:4d11:0:b0:894:3cb5:2ed9 with SMTP id 6a1803df08f44-8943cb532bemr93075156d6.14.1768841066683;
        Mon, 19 Jan 2026 08:44:26 -0800 (PST)
X-Received: by 2002:ad4:4d11:0:b0:894:3cb5:2ed9 with SMTP id 6a1803df08f44-8943cb532bemr93074836d6.14.1768841066124;
        Mon, 19 Jan 2026 08:44:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c03bsm3444442e87.77.2026.01.19.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:44:25 -0800 (PST)
Date: Mon, 19 Jan 2026 18:44:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
References: <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5Fdjag_w7i0zWN@bogus>
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696e5f6b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=M4nwLoQtCJemt5GeOY8A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FFZwAVPyQjRhCriG_CigAGgZOBkCh3ex
X-Proofpoint-ORIG-GUID: FFZwAVPyQjRhCriG_CigAGgZOBkCh3ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzOSBTYWx0ZWRfX+Gq5rWs9Qm+5
 FQDDEKMIP4pqhsYoHr0aXFtl7ZSZsDELBc2/Nr46+WeRTpSWebfhiaXIIZhAJU1SZIcuxxgShLF
 4rdNDUB8CEofayiiaG2sPX3f4eEpkXaSNtzVMK3kx4Qyf3PgYHibuN4nEA0hicToUcISPIlN7fS
 tYUoNb9FyEfs9VCyIhiiVz7oO2oViuGkSCxwV0DPuHuKWGoKoM2Qt3rh26zGi2sueiLstyYpTzO
 J9peODfxjVxizk3kHgIqNvG2y/pbzObDJ64HnLmtCpZaUS3t4tVnvPFr3FjA+48NLPjSojYOKnN
 OtsIu8KXyt3OlfxF8uNSS/04uGsizl3WS63eLWGkHJyGQgvpJR7N1WwkH2QwrOn/t4ta6A6yMiq
 YeYlCEOyoYtv+oC4TSh/KRvxUoF4zVsBCVhrG4V5TFITCc858UogdFpZAYjjNvH6DgKVFFkzys/
 GnUi13vdNZ+VPu96PFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190139

On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > 
> > To me, when you decided to add a second caller to soc_device_register()
> > you created a regression in the userspace interface. If nothing else
> > it's a leaky abstraction.
> > 
> 
> In that case, shouldn't soc_device_register() made to give error when an
> attempt to call it more that one time then ? Also should be change the
> ABI documents to refer it as soc0 and not socX ?

Then the whole SoC bus is an overkill. But I have a strange question
here. Consider the device having the "BT / WiFi SoC" next to the main
SoC. Is that SoC a legit target to export informaiton through sysfs /
soc bus?

-- 
With best wishes
Dmitry

