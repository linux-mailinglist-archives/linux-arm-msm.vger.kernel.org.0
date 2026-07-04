Return-Path: <linux-arm-msm+bounces-116441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OeyCFYBRSGrDowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:19:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBA7063C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ObwIJspu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UsL7yHbO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116441-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116441-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12493300B811
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9411A5B90;
	Sat,  4 Jul 2026 00:19:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B014883F
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:19:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124346; cv=none; b=i+R2aUj6Ti8G2PKHBf0N0Xy7Zmj4uhgQ3ZlbtqCyuI1mUC+Iv9w+pe1G8RrgXcUrsYkSE+3nCpuDEm9rc7FKgTyPaNW8iqgV6DyhjvIf1ISEd2f3U/4GHSF4N7cpLVaovgj0+hKVi7TUHs71dD7SgcTVmh8v+QDSvMVDhMH+h90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124346; c=relaxed/simple;
	bh=e7mpsbTHLCb38Oqdm7oyhjplkf+oP/6k/yMNHF9dIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljG732zYyiSrQcJgc0H7et/w2OdTTycB8bgODkhZykJKZ//Jebj9o7eQh4xxcAkQSXTDY3dHdmgeImiSHpuuNF4s7Mwpuri50ce9LTuGOlLqsNiEUHnwSYBhpJcjhbw/GJxyztePmXuMOGdyh9hN7U4+4MnfYboeomcFLY0qYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObwIJspu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsL7yHbO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPWMY890244
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/om1/hRDw+8Wf0vTsvREt9QL
	5sj54VpR1VfpMd3lQO8=; b=ObwIJspuVRWTzdbZA0ttr5ILy5CIqz6Cys5lHqk6
	BLhcJlvBchibrXm88cUOF1KpyoRRUCzqyDL6jYcBjd2aNX7A3VU3+TcKr+ataNPs
	0xVSgFNVutrOQ7JUmc/eigkMX45twtdfcvgNlUjR5N1J130vR5KtaXuYXi2NxgMg
	M/YylQuqt9x1cHRPVF5uIFW2C+XRKiCEXNPk1Nm9Lds5MYH4OFo69RFMFxpxKPou
	6BhN0TNl//faFlMNES6NI/fXlHDKgw2/4TlyKYJkSDw1PbS4opSAAjpeTZ+AsQQb
	4XRg6VKA6t7vI3yqDRAGIuhxvppTQCXdjJatMy9Qt/1JcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j03ef7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:19:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso88251285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124343; x=1783729143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/om1/hRDw+8Wf0vTsvREt9QL5sj54VpR1VfpMd3lQO8=;
        b=UsL7yHbOsM904o7OlCmvbEcscpG8y9V5cgAxSuPpqPnOMB4RezGratadOLDrJ1H+kX
         lSv1jS+6v9MhS7FI4ZoLd5FVcrEh1Bx47f7h+ldWpPdm+YiWtcGEAF4FxydH8VAp9H5P
         +3keI1Os3J1fzxITi1TIMWwd3clyd3HDf7mqepwxvdcFbqQKwGz48FRf0JiLGy1zb20V
         3XLh17aGS4X52fWYVvA4eCEzyCdkOrDDTMJhFSIAlt85IqY3TCKhGwvZJujJ2CETARS/
         5qy1C62K9Nw9eJ4cHEk2Xd6/25XezX3EjKB8EC0I209hhUjlBJBOje6MohWC4g8RM0m8
         2UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124343; x=1783729143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/om1/hRDw+8Wf0vTsvREt9QL5sj54VpR1VfpMd3lQO8=;
        b=cmDfaVyJTWRZuuISlACLXM9t89glezBtEtjup72/ZDzQdwVtgTjoy/tLhQOw1U/wSn
         m2wkDNUNV0a1UINVOK0ij8Rx/lDrDpjvkxatfiQ6Z/Gr4623h3oh3vc/7kmzZiaOlGiV
         ndJZVJx7/S2FA93uXb6q4DT71sCkYCxlnT39dhorKY3qz8RZOY0xQo8/yQc2ILzPKoKk
         mhAF742gxtIzVEm+D06zlOvUEyF3Ede+SU7OcT8VW7rVLhvJAUkmqZvTwJM4WL4cy/i7
         YDeF7m/zyoJHCToHEZffljJtz0SqNBrfEbxLCX+frhE4s5P8OjyayeV9PLm5nYk0evVF
         Dq+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+TJUsA4ev868LUPIfa6WNCMrbealHrxiV9vwOE4664tG/XMxMxewiiQewjK4R4u6kpEE+nrt+ezs6CQYbt@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcF0Vz6sk9Xqq5A1rEz5R3RILn3W9FjkvY3B8nskmqby5GWfT
	YQ9Po8bTMS/QoyP4noVJj8E/f8vcwv3lz+eWusPY7PdewRakkanZoaAyy7IAEizwwTYIEN7baZw
	ilEozDQkZLna7qO2r6Xf2Mib8C4vuMlKN5KBb/fHSWJffUGrnLHvdN6iGMnVVJMSu6CKc
X-Gm-Gg: AfdE7cnd2hUHoRe5dXPXBfxKqzfIJAt9hHsRIBzRPe5ZZ894kCRkP3eOeTLR/BODsHJ
	DsjJzhZBXyw+ERunbZzIhajHYbj7AZNjgw5cc9sB++x3f81aFBrvqNjXGNkDuBp5Q7Ms4dCOI/p
	nDXxy0j7d0EPZOGJCMET5Jr+GYkuMrQVLq+FGUAMl4G0AB4JSs2wHtqn3RjsMNpCQioSPnD1sVk
	dr2X6JQ3J8VXr7oCK+ougz8nSl5e7vUSY0G9VTN4BZj/QN+fDapE/EAcW9z4x2YP+XgCxkfQ891
	UG2exrt8GgyJ2XkWRnuKCpwssf0QhZINO7sa56jzpNYgHRAOammEF2ae60oSJQ1fDOZDWLLD3G5
	n8W1JwQNBiPpTg7xAZa7ZPFzLJPDmt5I3CmzZndYhrDV61dIA9J9TWX8wMxIFn1zI2XzmjzaumL
	pomy9U2sNRYlGZXhCUr991mHLn
X-Received: by 2002:a05:620a:4621:b0:92b:6805:eae7 with SMTP id af79cd13be357-92e9a51eedcmr214072685a.68.1783124343493;
        Fri, 03 Jul 2026 17:19:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:92b:6805:eae7 with SMTP id af79cd13be357-92e9a51eedcmr214068985a.68.1783124342979;
        Fri, 03 Jul 2026 17:19:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb75csm864872e87.40.2026.07.03.17.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:19:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
Message-ID: <svxscdqhtkzkyitstli6srm5el4jexgefudrbdyjhvywr6qdzu@h5yjvz4hmmvh>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: O9m_D_498rlxrR-mm9IC7i3t3PeoB2jk
X-Proofpoint-ORIG-GUID: O9m_D_498rlxrR-mm9IC7i3t3PeoB2jk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX8fT+x34ZzX9j
 LTqt7MKIxDwgI1VIgLqJpT/RzYvbSj76ul3ApKq9jE/duCM8Exz8HKMM617KxsVwsrsIcE13tMg
 GLaMtPtBMyD+OLj9tWqy9hcR4TgBWGM=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a485178 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SqtBJEnEN_GFa67D96IA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX/nzUokfYnWHs
 9RR6HyIIPknivDH7fXkgpLwLWipkKe5pTuBOREkK/4vU5srcuYvxjpL8W5jejI64fxIPrhg5F/a
 fpVE/h3/PqovDIAK5O37gGeFF5GVre6Kfi+AP5Fcf6YXQlthecJiaJPbHKs4Vc0nLbh3qVRpc9g
 ILB9G7Qx6+yRm/EMnKh1B5C5ZwA/CO/LivydMt+cuw/HtFHMLU0NeS+srW+K9BbT75qkU1k9uwV
 gFUfAdT4svMT4TCD3WBK2KrsPkm93zLwOROuXsji5FgzrD8ZE5kS+Vz4gh63MC28nF4G21vOsfQ
 lmHwUp6V2j4Ev3y4RYPI1J8BCVRfnKjmMuztRTTyz+g3ZTQcNzrnUBt1BjZoP0Lf8FjOe6JNk4v
 gADjaGdshILRBnyZa0iEZyE+2dYaAERLgteRR0osYrNX4r4v+PoxiqItzT6GI0YCkciNQ+uDN83
 DWDEi7DIzhvQLvJSqSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116441-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,h5yjvz4hmmvh:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CEBA7063C0

On Fri, Jul 03, 2026 at 12:01:32AM +0530, Imran Shaik wrote:
> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
> the register context across GDSC power collapse.

Fixes? cc:stable?

Also, while we are at it, move all fixes to the top of the series.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

