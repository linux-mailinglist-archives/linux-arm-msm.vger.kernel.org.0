Return-Path: <linux-arm-msm+bounces-94962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO7VDcafpWmuCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:33:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C21DAE97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D27E30576F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50885359A69;
	Mon,  2 Mar 2026 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kI4rGNmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SskVTc+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9A3FFAC5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461909; cv=none; b=dcZ6Kb+ExObuJSWKTzd/LKtmorInyhGbbqARnPL38TRluDg6noB8e14puzSmrhHS6kDXhVUGPdg4mCobRmZGEtAVUvzwr2R6mMoL+na9kqYH4F9AuCCwvPF60Mv3WoygxBMuAD7u2X+CELrEYqGc6f4uZa93FyfNYCMtLOcY7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461909; c=relaxed/simple;
	bh=23t18syiBuaDoyiGLjw/6hW3FPf0nlgMaKXF5rCREmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubIMaMm8ViUDBT4AzuUjlWdFQxhxQjijVdIsUWWkaukfv8ZjPBGv3ID/YVBJt+VwXyEgygjq2FfGd37UdoMc3O5TDKK/DB007XDz3MZm+umVK+XH3eme25aDc1U8RrApSEca5GubyZHjkQX4kbkfwQFPCP5IkY10jVcOdTD+6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kI4rGNmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SskVTc+l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ENWbi055870
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFWaxQWimcPR+QbxBkE20FFlYIXJCYxgEXio4txi5ag=; b=kI4rGNmPBH2yeV07
	TaSKxIpv6inGfxq03xOSrYTQUdPDZze+gfNMivzlfbuk/oWYS5ELJQKP5MdGJAJ1
	dUhoD9W6aU55EFujyVrnowiuVWlzkKNGpS/+U//tO3l9kbZW9EUsvkW63lkeTtiC
	sU0CnRy9gXku9E6uzlCxtskRls30I4qYhOdfopvtxTne6t8APaaXoDny9C2VCW7W
	32B/YM4xcwA8CthwZ9eZD6K2EShGI1RsivjxRoZzoGCXl2rwFHOsse6cXCnuKZQk
	wLvz1l6jv719IB9YLIGKBG1yfqua4euPmK/AgqpmASyxkqktG9mr6VuVNNkwcyVn
	c/oyvg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64aqx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:31:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5675a5741bbso51883528e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461906; x=1773066706; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UFWaxQWimcPR+QbxBkE20FFlYIXJCYxgEXio4txi5ag=;
        b=SskVTc+lSAeQGCtpsglMpQro2RZ1zQcLPoOs4I1+/B2QDXXXfN33HDfNjmZyjQaQvh
         Jq3HifDo77rropWKoCpP4jv9MfTFdNPXsdj6UHLSW2c1D6aWWoFZh8u/ccSmnlqpA23d
         388dYseFjQji3zU/9DLjq2hGCDAv5osDqAFxI9p+W+1WtqEh+9GE4RWHpKQH/9xHwXr8
         vDFs0r5UiW/Q1dJqiB9Ttf6gi/mCyt/xbkTwLwAEEcbqCQkHTsbhE6QEHkaNbhoa+LDA
         KNQC3Wx87irh2FGgCbxSvxsVUTNotTKXATYkJm5W7jaVa+KOfK4leeCr5ptpvm2unsov
         9pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461906; x=1773066706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFWaxQWimcPR+QbxBkE20FFlYIXJCYxgEXio4txi5ag=;
        b=gwiFdkT6ScSGJJWRxP4RbziuKMokpbDQIK4uFOz+WtS9nAiMIMMEpu63sTikAlBnBG
         V4oKVAycgTdJmpF8/KrvDfBDSamlOBCX12gaISElQr7OwGn4NyOfpvZEKm787S8hmb73
         /GcZHa4EhgZkUDcFhNqKpTyGNuYp2UHUDhL4/gbbE7JWLbXSZtxbiZrn4KMN1Vw/8hQf
         42nUDCZjrJoVZ7QY5QCGH4fpyUDP+1/fW1yS1tCwzbFYD9UKdnHRbh/QlJ9e1pHSqxoB
         X72ldRQZsspjbUP0AT6K2nbEimAquxzU5hif+0sid6lfM9hxdBzbKGkErpZSDWtFLCn5
         lHTg==
X-Forwarded-Encrypted: i=1; AJvYcCX6kOrv3IveAONIVA4YWnDVn6mh+xyLllCwAsCHOjJEtoqWDR/x72WDc1nps+V9SW93uvHmCHokf98IrGGN@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRdWldt+l+D8lejs2nO8X4n4FMHFvpRWkbG30RO5x6vjigjM+
	bk0ItLV90ZIgaijUa2Q9+1PIZyIB/Cyt9Ra5KQoIDtap1MpW4anX5GJaMKLSxnDYIOZT6yo6y2c
	3XH+pyH7i5E6iCK7EJt4R+cELspI9tmb87BENByOmKpIXzliqFB6ZJ7Vwhk43JYp7J9P6
X-Gm-Gg: ATEYQzy9FCweaYsr/6HTsBMN0UygN5xkLDbsWMMVV57S6Wey8wD/aF3kQqb41f8Ysq3
	GioXwX+sPfuULMvbwMZDbIgJ1RnIiBdAnugmr2i/Qd76R12zceKpej9pWwGX1xLjTgl1DNIsmg2
	lMx4j4GMSPP3C9isrROscK03O2iVegydE8XIR7AHzUsoq8zKgkpHtK5p3TdBcH2URc8YdTfSqP5
	xL864zuOYHjoKEUqkJ906GY8vezjfd6VCUHizyy/Ur/W69cVTD8aCZKEPGnj3gn9eIW+Vn3rESC
	p0SaBXTdCDs8rKxCySSzFyaWWMsVXx4+9H2YaRkdm7SfYVjc8kfZMcbLoN5rAJbT/ElZsOwBrPk
	fp2KXnYcXKzJ/ucXEyL9nsc5xQdDLqsCHB2/qWDpQ4liYnENfl+j5GqVf9p7It2Yo4pNL3GSJi6
	L6vvc2ciZq06HqCQGwL1pNczu9yqqblO/bNa4=
X-Received: by 2002:a05:6122:1d90:b0:567:fb8:c7ea with SMTP id 71dfb90a1353d-56a90a02e5amr7560043e0c.8.1772461905789;
        Mon, 02 Mar 2026 06:31:45 -0800 (PST)
X-Received: by 2002:a05:6122:1d90:b0:567:fb8:c7ea with SMTP id 71dfb90a1353d-56a90a02e5amr7559990e0c.8.1772461905278;
        Mon, 02 Mar 2026 06:31:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd238fsm1630119e87.11.2026.03.02.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:31:43 -0800 (PST)
Date: Mon, 2 Mar 2026 16:31:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_jingyw@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Reserve full Gunyah metadata
 region
Message-ID: <3f4jhmdavfzp4mv3o3mw4ie2i3zvhvyvertpab37zxc6yluzyi@byem7vs7kv33>
References: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: sV7V2BMyNY3UiXvfnxaK3h_6Pj8w6VDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMiBTYWx0ZWRfX9p7VcL294PQt
 CStiqgQyH7oxr69aWYeVkIqqxSWuEmxy9W8DNte+9iKRJmHaoo9ygXxvszcfwz5NNV+FGBc82vF
 6VbDgec9ASAhy/KOVBm/Lw88p0KAPmBc0vxFuxnqZTknr33Kq4w7qZ6uVuvcAUdonF/1wek3wcE
 /9onqjuN1SALEJdMdIGCBtcaH1e56UGOvOufAxpwiO+BnKKWi7sRxHKKkDuzjZseIAqsf/3Li03
 IoE8WrBGxFRO7wn2a/buVR8naLGDI4bWLmFSGflvL8fP/sQ8U7Y6fcksvk2lDZHLhAwAuSA7wBi
 i17itFbYuyngxxcJATDCN+u5A7l7nlnFFLScGszuicqy5zKctpRI+yj1WQGGMua9hlM/7ATB7yZ
 07Y1ssOnYzglBL6Sm08lo/cCp7awtzxCNcbW5ottbKe/v2EAbcjgxwae7iaogKKQpGK8nP2msz2
 iW7yeWqTeFK39at8IkQ==
X-Proofpoint-ORIG-GUID: sV7V2BMyNY3UiXvfnxaK3h_6Pj8w6VDJ
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a59f52 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ddBjuLbzpIDlxO-QRmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020122
X-Rspamd-Queue-Id: AB3C21DAE97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94962-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:26:03PM +0100, Loic Poulain wrote:
> We observe spurious "Synchronous External Abort" exceptions
> (ESR=0x96000010) and kernel crashes on Monaco-based platforms.
> These faults are caused by the kernel inadvertently accessing
> hypervisor-owned memory that is not properly marked as reserved.
> 
> From boot log, The Qualcomm hypervisor reports the memory range
> at 0x91a80000 of size 0x80000 (512 KiB) as hypervisor-owned:
> qhee_hyp_assign_remove_memory: 0x91a80000/0x80000 -> ret 0
> 
> However, the EFI memory map provided by firmware only reserves the
> subrange 0x91a40000–0x91a87fff (288 KiB). The remaining portion
> (0x91a88000–0x91afffff) is incorrectly reported as conventional
> memory (from efi debug):
> efi:   0x000091a40000-0x000091a87fff [Reserved...]
> efi:   0x000091a88000-0x0000938fffff [Conventional...]
> 
> As a result, the allocator may hand out PFNs inside the hypervisor
> owned region, causing fatal aborts when the kernel accesses those
> addresses.
> 
> Add a reserved-memory carveout for the Gunyah hypervisor metadata
> at 0x91a80000 (512 KiB) and mark it as no-map so Linux does not
> map or allocate from this area.
> 
> For the record:
> Hyp version: gunyah-e78adb36e debug (2025-11-17 05:38:05 UTC)
> UEFI Ver: 6.0.260122.BOOT.MXF.1.0.c1-00449-KODIAKLA-1
> 
> Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Interesting, will that fix some of the issues we observe in the CI?

-- 
With best wishes
Dmitry

