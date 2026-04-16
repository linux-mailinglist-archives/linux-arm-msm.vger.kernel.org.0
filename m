Return-Path: <linux-arm-msm+bounces-103358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFWJMpKu4GkRkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A140C80B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F318E3019514
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF150396573;
	Thu, 16 Apr 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6DvFAJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C90jcfuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556ED383C7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332082; cv=none; b=DjdDSAEkxexXXG5p0dVaiAcwp0Ua5xpO4pPUDKBC/rnzMr0IenVWm8+47ovfLObnZNIMFsWsJb8pv4xSazeIxTbr7pVytD7jylZBVdfuVAJUyI4/4p0AtMtvgIdtPLXGFs4ZNuvPSKSLK7FrTMtNzk5lMyZlk1DKHu/K26NWJ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332082; c=relaxed/simple;
	bh=yu2nE6TA5lJSKaHPKQQP5T3dbPIDrjr9c6GCmZogJvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vfv0VNQ6l8FxGXW7dLKtOrgTXfby714u4tkyUzqK6TjbI/cUUndKHtNXquKucm8JXb1CWJvDfMcxaRnLM/HoaxF9G2iFp1dSVdpnfdm1HS7knOCGiUcfnnOMxy7oGrJlKAfVFDFhxfsz4kt/eAgYBFh4nnCS7JziU2rsYb9c5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6DvFAJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C90jcfuG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CTw22576006
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jU+OpYG2NjLzwClaibeJae/tBKnPUhrrFH2K3PETI4=; b=j6DvFAJld6q3hpqD
	obcJUdQ4CRfUyvrKzwsN/yQMSe9jsglS58gDmp/sy55snyHXuhc6Qvu7GHd15vtW
	K/I2DVKeMB7IxxfWDmp4wrw+eWP59lo4kuxf3DH6Dojrt5I4FAkVNgjeR9cuwMjk
	l8DAkBvo903QP7Lob0fwQKa7MVWFcEFMSOgIWkycz6uWFRcgON+4XgYaU2hcvQcD
	Hc+kRwAXMHJf0Tn2iC/jYB30Rf9QlHFfURUEsZGvUydetECBfNVW7J7ySarnlJaV
	tlKrWjAzgf5euCRI5qhU8c1q/N6K1xB4CzWxgPgBcSbh7ONIqDSZqGpl+t06JyzC
	4HeFLw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27gc8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:34:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb4b340f4so12504866d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776332080; x=1776936880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jU+OpYG2NjLzwClaibeJae/tBKnPUhrrFH2K3PETI4=;
        b=C90jcfuGSWlk0mX8xX9dK4ukV4R5vtGKoDk5aqmdUaCWE5G7mmf681mP8TSFah7uAz
         WyvGdZHoqJmF41pZfVhwuUpPVRZIMVz7Vq067OrCYzwvJa7SxF6+Vn6A5mztCXac83F2
         KtJ2BqrIqthWNQP6RYn2PG0PYstRLCwej7WoSG35xXvZuXfrYGJayuDQ0mLdiJjDzzJ+
         5f66VuZ50FA01DdLASP+qMX9soC4WitvNvl0sssWFeHGW17sFx909NcNM/eT00TNhkqT
         4rIVnwLD00XlwrXBVQceZLLAvGHseyd5pUgKdk/TpXs8toehiSvTbAVMN2Kny+tYoHiE
         sz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776332080; x=1776936880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jU+OpYG2NjLzwClaibeJae/tBKnPUhrrFH2K3PETI4=;
        b=QaieBmX7r+C3hrti5l8QzM4DBUeKOpi5jhArTlq6orFaFrmzf8VGRe/VLJpPqWzmL6
         AeIs8sMquvoLhUO+kmmwGoZwvsKACwNXmC0QaoLWs8Wk17yyLTDBIOmfIrkg6kg1gYdY
         RPqoydo4vE02I6csnOKJBWlsgKWZEqrq7tjsnmDi7X8Z9pS+T78dbKgmdGA3FUJG5xHh
         VBsvAEPXgaKp8wpW02Og2PVLBf99MOa7evfGULIJG1TEdTqBGjz4wfK6KhVyXySOkNXI
         L2V067gbzW1tuOS3PGF9BULOGTf+xkcYMbThCJnFhRNkZaWACfkKWdqRvwEG3Aq60upS
         r4Bg==
X-Gm-Message-State: AOJu0YyQcOPt/vmdQ7KMDMSdiLBI9gqOEsmNlxwh0rDtpDMjYpULzrDd
	rfIAluNoogKC+4OcqqDYn/7W7SrlTd//38he0vq5re775UhAggPyanH6C5hPAqRcuXMXIs1RMl0
	xWYFXJ220OZItYSEA+wFS7p9ski0ZNbywIO6MKPWTBLk8wNx8j4zCz3ygC8yz10MCOQt1
X-Gm-Gg: AeBDievEjeZIhu9t7FhWnDXyItn5qEfavYHHfgw3FyBIBVfuc3wDjBTCcOjBT7uafnB
	7qKCSEiG7VLeeQeDbWvw5JlPg7iv8V8PghoA+aETV6WT+q5IWS9WQORhJRYVIDDX0L5NuKusPzw
	b9FErebdKY2n0Hl+Rbkt2zX9RoTn+09A+Ksn+5Wz33EDPjloLIuCKfsj9Kp7ujJtVUFx89ZecCm
	zhTNEp6INuEWV2YVkCUrjaPSeO23CzBuyrEM4QnwY94yz+PMHsGwuFrAeahfuzmjEp6I14HNEGu
	UpW9p30Y7uBiQWOw4RA5W4e81evEix9MYtli75TvZwviSLW+FxIwjLU26q1X4BlOd2ukQgb5dch
	9v6jYm4LEVNgsQFLZ5uDwhhXi6HLOnr+VnjFLlqP5HI4eEFVA2ALVyOV/A8m1c2I5wloAcSVS6U
	xO7ZHv6NX9T/G7Jg==
X-Received: by 2002:ad4:5dcd:0:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8ae6a86d0dcmr68702516d6.2.1776332079749;
        Thu, 16 Apr 2026 02:34:39 -0700 (PDT)
X-Received: by 2002:ad4:5dcd:0:b0:8ae:65b7:1b0a with SMTP id 6a1803df08f44-8ae6a86d0dcmr68702296d6.2.1776332079310;
        Thu, 16 Apr 2026 02:34:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba177dd36a5sm148812766b.54.2026.04.16.02.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 02:34:38 -0700 (PDT)
Message-ID: <245f4589-d7ca-4d6b-8162-a86972752bd8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 11:34:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0ad30 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LtuECjIQMh6IDJMuNRUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: WDdUXT6-23I4YjICFN4JJhIss4sud0rU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA4OSBTYWx0ZWRfX7y1DIo/FiWj0
 otg7TrHykoldJ9mDCrcAVm2zbuFTcfw86ZtK+o7NQANRN6Kg/AtkMmNiB8jWIfS8pBM25Sv6rm1
 8ppFFugUSR4yVi3H3h3CeLr1gRyUHWAf6d79bN2BpOAXOcEP2Er8eEe7+dGPSEshSqRM9Md41ew
 yHffLMVImeKgGXFk9vCWdhPpc5FDmKmHMpvvaGxkSwPdcxd0cjSq1ssRtyeRTg8MQxugXGij5lN
 MEKQYT4x8diiJ+KIMi8D96CYex/Gcr4kDot8ROaxaj6byr0gQ0mQ+eeiC+79L+fEct2cLWf3joT
 MmVSzfLXCNhHO/+qz6gKeYYrcFfYVWujszcgMkrY7OVp6h9Ex10Y+n4h6ox1Ayu3bA0RHcWiZpS
 n+aJI8YEP510a5P/yX31it5OkARvK+wToRZMgiGW7NeS97JnHIyXOq8YKcMHG8/c3ta8p8zGMj8
 lx2dDvtTT+GRkFDztsA==
X-Proofpoint-ORIG-GUID: WDdUXT6-23I4YjICFN4JJhIss4sud0rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103358-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B0A140C80B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/2/26 9:28 AM, Yongxing Mou wrote:
> The eDP PHY supports both eDP&DP modes, each requires a different table.
> The current driver doesn't fully support every combo PHY mode and use
> either the eDP or DP table when enable the platform. In addition, some
> platforms mismatch between the mode and the table where DP mode uses
> the eDP table or eDP mode use the DP table.
> 
> Clean up and correct the tables for currently supported platforms based on
> the HPG specification.
> 
> Here lists the tables can be reused across current platforms.
> DP mode：
> 	-sa8775p/sc7280/sc8280xp/x1e80100
> 	-glymur
> eDP mode(low vdiff):
> 	-glymur/sa8775p/sc8280xp/x1e80100
> 	-sc7280
> 
> Cc: stable@vger.kernel.org
> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

I went through everything and all the sequences are OK.

SC8180X will need changes, but it's already incorrect so this
doesn't necessarily affect it

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

