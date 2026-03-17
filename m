Return-Path: <linux-arm-msm+bounces-98111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIuSDuYbuWm+qwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:16:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9A2A65CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 10:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8823D30417A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1671C359A95;
	Tue, 17 Mar 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpA55TNu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmfYvzh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A91358D00
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738949; cv=none; b=GKh99ZJZFT3hdlashTv/94t/5h+YHldHt7CKrkC/XcXd6QJphIKW7/OMpJX7mGp/AvpmERBc4T8YO1AG00XFkxHcHuzuvyib+XITa2zVDsKkJZGg08OR7SCONSFrEkGxt+UZ1I8RWtCkhWOI3LEIBj99HHPlfkW92Sk/m7Cf8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738949; c=relaxed/simple;
	bh=tLDsJ3xH3Spdcca9pdvNzIb9hidWDi/5wO6TJ9xN0hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9sgYYH5t5BCEtAQkwvuSqbShgm4rdRhCX26fUDgxc1CJglFh89BHE8zvEalPMgIPcEIRFKb/OVkFEyPHp+WPzgqrh0mLQ2S6yaXhlmVa7ZXTbDZByxYctDJX/xZY7di9AZ3x9zcPqr9BEj1/m+dIsN7S/0R1DvpNHc/9pUaSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpA55TNu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmfYvzh8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4q3mq1428759
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=; b=LpA55TNuDvPNJoZJ
	o2ILbP6uuKoSILs/FaBIqRvUNZ3rXskSgY0pe81mRBUvlXjly7VqErYdDVHkSMyl
	5Phvwp6ukaLmdxsEpnSGz9YvXu97wZj+sSBdPaiFBpVT8z+FKETtM23WP5UWEbSp
	PDJZpysve5jZKLKrzg5V6ympYdkRal7q7DrD+dPYwwijhpG6Bc2XRoXIGjPO6HFU
	5mPc5T+DC5BY/WjjNVTl6jgxo4Ubpxa04CQFzd/rYgUa7UKELDjoxeGLITkf7Bqn
	TWCXdulkZg+Yks3teRIS/oIzbGqFSlLlfNQLz7bsLGZeOCWdMtJVPf8/IpJjzXHP
	tUwg4Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh99c3db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 09:15:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso398583685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773738945; x=1774343745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=;
        b=UmfYvzh8Ru4caShAWZS0a4yn32y8OyztfdOgNZfLRK4yBy8AVtUT0EhUnmoz2NcmUm
         T0WZNjXhBsdOebUKgqxlFL1BWOWF/S6CbM5LEyabGXKZ/BK66oyJxwg9PvXbgGh8lL94
         nB8Q9zxMA8uKmS2S/IJRL/opQW7QnDhGNue8UrUIfMml+rIYDoXCOqSG9IZxL9UeQKLu
         SfRVvqkviiYeIojMDrtUr+/MXVMZAZqnsebS5UwvPOgAY+mqc8065KaFSfhsL4KgAUCg
         AvJ+teA+yd56jVaAvMxTJA644TkrdJ5f8V2LI9s/JZAUshZjON8ec0pMINoTEHZPYV1U
         7MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738945; x=1774343745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOuiJ6MeDMkaWLveMBBkfhjpipSzpptBgVxbpSymF94=;
        b=myTeeGO2kdN9/BQt8NXYnYxwNFxPqEnGochRDeQNKiYgFBLs3qWuJ4xWmFxuTG/CW3
         K29W9mtNnEna2NAqKhFAvIUkNfZ+S+KB892dptKo//aaQdsKlcEwfQNVIfuuaWooysmc
         ecfWv2qRWQOlHu8K+xchwAzerE942QZ9MtCRDIkBlxctUtgdMbykp0V0jJvKY/KNu8N7
         yQiNMCTNI+/57rOadsa3L1BoffQqZuI4OG8Cr+LqT+AuCe0IBt2To8HRGmkRkWAJCdBC
         R3Fii937vCicX4tdr4hbAOoXQPBhDGELo55Vn1+A+wl/nMLPY1uMLea90fKu71FqZySy
         7SJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqaIvcLYJRzgdFCU0oHXBtP3K51D3cKEMtFq8cFGWUPlp2IKlU/7YtVH9FhywWNUcDnCd18rnNVsmiQtJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3FhjQVhNWylW7ftQPwvIDLOBBJuyf0cjv7SYqEqoKPcdTCrE
	UMVsY42IZdCrcxgQbElzmrlIcC6Q97yQjh8UeeaQaWjTQXxZ0nsAhMB1mchyYHTPxuQmUOBB1Lx
	6KBauzSQAwA0FtvSKuhNgf2Sf7Oya11iAUxNb3tj42zFphK2Y7RcyQLgs0UeMsyatjz9u
X-Gm-Gg: ATEYQzxYfX76gFTTeIBQljwNORZHXAbbKSbORm699KBRdtdVq6loZYNYnO4wfwrgK7J
	202/GT+MSEYboR+m4/EpMsAzYkLaBUfn9oaGV5cv21lhWUdU7Vy1sZ9if6g/v5Y8ILN0xZNdJO9
	o0ddCjOKIQa67r9w4ZMN83gIIl11btCyWCWCYr8jCsuTjHjkMaAN/MjoVJuyIh+UurwDnJEyFoA
	8A6O6/JdUTcP49rRRgf+aavW7h5pNiWAPnKb8gYRB9cNNGEqKGLnQbsWgI8cdK6DLGqtL93F49x
	Prj0iRU+1aAqer9N75qG0BiU1i4aqbLHFQx5YO23PmbblJ7iGj7o4oqVCiXG7azHtL1zUQZ4Bg3
	fEJeabbL5LHo6VClAz2tefjfVR0EHsKH7JRtGIVRGVX8OaX1q4iKeBDhwdibsjmKUSBrIWjRMfo
	PSTMI=
X-Received: by 2002:a05:620a:1a0d:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8cdb5a2d5cfmr1661635985a.2.1773738944987;
        Tue, 17 Mar 2026 02:15:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8cdb5a2d5cfmr1661633985a.2.1773738944550;
        Tue, 17 Mar 2026 02:15:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d73f14sm6262122a12.30.2026.03.17.02.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:15:43 -0700 (PDT)
Message-ID: <f3344006-5511-4f1b-aea3-7dc81a091cd8@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:15:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com, bjorn.andersson@oss.qualcomm.com
References: <20260311-d3cold-v3-0-4d85dc7c2695@oss.qualcomm.com>
 <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311-d3cold-v3-5-4d85dc7c2695@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b91bc2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U-o9HKKhJ6a-R5p13S8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MSBTYWx0ZWRfX36/yMd/CsOtx
 xxw/j6bNhWciZ+EbFmCkWKrdZVPpMUieGgCWcPUq62SoukKHp2oM9y752F6eCrSJBDV9mJDcCDM
 LhIRq7fWHp80byG6bgAAGgwxumG/x1Silf2rpqU3sdHjj1HkegzywqewgXnveV75lQXxDHM9v1e
 bNd9cD+UuypCY6eh7BYdMpPlFzgOHkivl6VhAFvgiUzRw6Vhep+4xek7Z+ItL+U7vGpFkXFDN8K
 kj7nGgtYxXk/rAE7XFv1Yu7gOlh6AJIZ/SY2sQ0W3WeLmwXygbYShRB3L6KM5U0Qp6WTxW27Dz7
 1G9yoI0mo8pTC0WkG53nOO9L0/i/ca7wV+CvZiTJMjVNKiVFnUXTYg4CvqOJa3Cmov8dl/F5vyR
 ZDXVSnRj0V0Ex5kA9m+quy7eiXy791JJIg/05IL95vRhfdb7pyhzBjdLCsEl/cqV0eis4OVuD6f
 zjexDBoSMb5tRc/UrOA==
X-Proofpoint-ORIG-GUID: ZHrpvZpPXc1vNvZo8bnd4aaN4DGHV7m2
X-Proofpoint-GUID: ZHrpvZpPXc1vNvZo8bnd4aaN4DGHV7m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98111-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4A9A2A65CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 11:26 AM, Krishna Chaitanya Chundru wrote:
> Add support for transitioning PCIe endpoints & bridges into D3cold by
> integrating with the DWC core suspend/resume helpers.
> 
> Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> into the DWC host operations so the controller follows the standard
> PME_TurnOff-based power-down sequence before entering D3cold.
> 
> When the device is suspended into D3cold, fully tear down interconnect
> bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> by keeping the required interconnect and OPP votes.
> 
> Drop the qcom_pcie::suspended flag and rely on the existing
> dw_pcie::suspended state, which now drives both the power-management
> flow and the interconnect/OPP handling.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

>  		ret = icc_disable(pcie->icc_cpu);
>  		if (ret)
>  			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
>  
>  		if (pcie->use_pm_opp)
>  			dev_pm_opp_set_opp(pcie->pci->dev, NULL);

Does calling .suspend not drop the vote by itself?

[...]

> @@ -2132,25 +2138,46 @@ static int qcom_pcie_resume_noirq(struct device *dev)

Similarly, I'd expect that .resume restores it (and you didn't do it manually)

Konrad

