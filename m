Return-Path: <linux-arm-msm+bounces-91254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5aBwMhp5fGmpNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:25:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DCB8E5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AF7730210DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 09:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD6130FC21;
	Fri, 30 Jan 2026 09:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1OXnJhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0hn0PmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E96350D7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765069; cv=none; b=dKAJWrPTKedQpK8HFVeeDp5T9qSnXzYRLnufYuEpMIol2hscuhTsmti5bYUaqiFuaMx2KFmSAAQUs7hjf8nqzhOrPCqh2kAMC+gBKhqAaGJugo/3RtTLP0snExPe2/5oBUYqtt32BojyQ8OkYZGeKCaYvaUMR1PYxSxtl6sFNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765069; c=relaxed/simple;
	bh=x9KQggMvdBzW2XWw0prsmdNny5w/coy431YP3PWuX0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJZNs7m2F6LOvPBKf7U6MNp2feRruxfX+0CgDy41HRt7gMBFNcXhBAeAmjGRDVBlssTNJQuqPTk3iVe/YXIBHGT+TriW1hiH9j4aQ62ln7yAM9aWlrGHCpkhyDBCjoq7ioSdkQrVMvNKrpuG1DyqiUY9tdsXIlOLRdsz/DWPSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1OXnJhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0hn0PmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VnFq1488328
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/rZU3GM7qaI3gxk5HPWg0rEGI+6crLKyL1un6ZegdE=; b=d1OXnJhfV2Vp3VsR
	q0V2/RrXDUco3w+/2BAti3UOJg/TpcaQnKMjOcnNSSDgE5t3Z+asRU8Zh/J6ZvCn
	forJTCBdON5ZsrZ6NyAAHmOx3N3KfyBuuI+LGHrF9jQUvcytoI/9KIMF688AqZqy
	JxJZylMi8wpQp6QJ1YcATlzo8fbFZ3vQLwrPUogXqERGa7300CUjtmjLk4oy04ht
	mkxzSzps+3o3wEGqTWFb17sj9wEKzYOJDuzp9QI51ibjcmXSpVe7WQeQkf25ZHZx
	dkmEEdLm3jw8NPwPygc+m7H+W7A2n2IJqYMDcDoetWGxh8DUHDs9pE3Si31OFOGH
	QaMogQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bp3tks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 09:24:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so14928285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 01:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769765065; x=1770369865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/rZU3GM7qaI3gxk5HPWg0rEGI+6crLKyL1un6ZegdE=;
        b=N0hn0PmFyWjvrjC/5HhIBSgAmQewBJJWXrPjepQjzSjCkSNCZoxDiIyHoVShXUskUE
         xrTh1Y5h6I891Y1f+txAwImds0cKxrm2v/3XLm9DThq+B6C2cBZk0Qf53YTRzFDguPwe
         zHSh15p4/K6aoaQY8O+UrjlRMTjRkz1vCYsRTSlAnMgFSXLXnb4s35m1FyWSyf13NwxV
         4JRf4CsfSZgcasyGuhltO+WrKrAyu30LLRBFmYe8Vl6S2oou5gLPUbwAT707D9O/dHSW
         DYdtWQqYKudqylwT0eQT0zJ3GItYxaKabWfmtdL0CrDpiT4LK8Wd9hZsjMjuarPeXXfj
         98YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765065; x=1770369865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/rZU3GM7qaI3gxk5HPWg0rEGI+6crLKyL1un6ZegdE=;
        b=NQBDa6v3JDxgIvJ0S07m3zoVrw064vyggTEZ2yDnmkrG8pTI5guuoi10bMvbZYXBx9
         oYMD+PJKgBOeiz7jQ/pBuHHxBcoKGF9enNt3Oq2/LRTS0cd41ogLpp5U6ixqS0OsaRvC
         EJKx5OItLCUVAaj7PO+BcZHxBxljLmSNIJJBnFypDB2IVcqKMkLx0n7mycr6fYRbHvZU
         YYQRiPxx/Gr5RFv9FnUHyzVdv2CmDsDdqzvLXKRBMhKYG3G2pMTPcCJht3D589tHB+bt
         XPPnxqcZvjX5ki3THNBQvpwkn/sk5Nq/NcH5Mo7XCglYAFOZkfwmt8kzgWun4YlJvO6r
         xchg==
X-Gm-Message-State: AOJu0Yz0hGnUcoxNp0OMPDa45L8QhAUjRK+un2AFaCreROLCiqDujeRD
	q3gGSqC3mfxFnkRd7g39YN7ll9OBxRws64eQALjaXzL0H/hrSkVFODw+zvGCTX/LmIDlAKJ0oJO
	jdMtZEWL6d22CrPo836U7iKryXt0WM3HxTMunxF5Ghd3GT6OHK22HkGRZYEyfMILLccIl
X-Gm-Gg: AZuq6aJCmxZC19JTmB4d7sLoqd/mD65h/fEJGpNp9U6adm/JN4CNLDMWsDAXIauOmzx
	kunl/YD/Mzh4CWsA8IRaS3PkOXAhls8Q7suy1cugexSVvdDTcilJqlamvJ/SmkoTPSKg/EXIjEK
	b9idZW7ofiH/vmfBs9PLXgvEp2XP/75lXrMNvoYhYh0AEmYezocO5PxKh7RFuZcX5YzgtcRAHGr
	+rLKZ3i8uUd7whwM8DNXglYYzmOsbqxSuzcJVuZcTD0M0KBIsreL3vEATMhCC/8wO+PMJcKa+V/
	V3h3dM2YvRnE89lGvLL7UcoG864M3gTIX2bEfLZN3GFTuiX7DZCy5bjwC9F0lWzcynIkjvxoJv+
	83kMB9eay9Rnzc63IFyqwjrTevVWBlOcZHPiSr9hI0vedaE3LaHG5JnUe4RAv874WqGk=
X-Received: by 2002:a05:620a:1714:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c9eb30315dmr261851085a.6.1769765065212;
        Fri, 30 Jan 2026 01:24:25 -0800 (PST)
X-Received: by 2002:a05:620a:1714:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c9eb30315dmr261849785a.6.1769765064712;
        Fri, 30 Jan 2026 01:24:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcc71f56sm258397766b.11.2026.01.30.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:24:24 -0800 (PST)
Message-ID: <68702c64-7ee9-4571-9fce-0b2d23b3c03d@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:24:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add remoteproc in EL2 device
 trees
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260130073113.3091884-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0eQxj-9hYPH9ychzqfi5QnbXZ20SvtgI
X-Proofpoint-ORIG-GUID: 0eQxj-9hYPH9ychzqfi5QnbXZ20SvtgI
X-Authority-Analysis: v=2.4 cv=d6T4CBjE c=1 sm=1 tr=0 ts=697c78ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iBboiVjmBFT1cO5Qy4cA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NSBTYWx0ZWRfX67nLnkJHimcj
 VwKeypueg7rkzxOfN896I/JJPfsY3BaledH1jjDrlcMKQb2zS8gZQx9pJ7MLioYsNaptiWZMH9b
 cOMLQ/4lWzE6o/sOd1Bj30SPO75PxzysHc9RVO4v7mFn8YAdvAjP4/C4FStKbwhzrNef/F7zNaJ
 26HGmuyqsMnyJucsXx/2/rNscLQf4iosprgyX239OjpJRhkKOmqJdTiznbQsuaNM8ox0QAtDJ0m
 miw5C+6q60VQs25j/QPKGOXT4XlrBtV07g96ij1LJJniCwLh1OVb0xpssdFW67clPQfh+sjlZur
 q579pvgZtAZcEVnzbRtdyramFuYw5KGZjguhmrPpMj/6ImD8QmVGs0r86iW1/NixBWU5BtolhHc
 oWkSD+X4XRXeflxFVnmXe8uf6821XUWHSohF+smVVEB3/68QE8LC9VYy6fQHktqYc2mzmdGnfg0
 rObHVR30M8b6Y5A3KqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91254-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 235DCB8E5B
X-Rspamd-Action: no action

On 1/30/26 8:31 AM, Xin Liu wrote:
> All the existing variants Talos boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on
> those devices.  However, it is possible for us to boot Linux at EL2
> on these devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add remoteproc to the EL2 device trees to generate the corresponding
> -el2.dtb files.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> index 175679be01eb..8279854fd73c 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -52,6 +52,14 @@ &pcie_smmu {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	iommus = <&apps_smmu 0x1000 0x0>;

The mask should be 0x80 according to docs (although the resulting SID
is the same)

> +};
> +
> +&remoteproc_cdsp {
> +	iommus = <&apps_smmu 0x0c00 0x0>;

This looks in line with docs

Konrad

