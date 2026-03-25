Return-Path: <linux-arm-msm+bounces-99913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KXEHqsbxGnlwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:30:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6180329D52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74B83114572
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C653FB7F6;
	Wed, 25 Mar 2026 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z51ZTt4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI3DhaKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1112401498
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458984; cv=none; b=fxIJBrmd9NSMrFVX9Vi1Y8Lxjwprz/XxzWvJiuxVOjCu3xc/U5MtqO9HFhKuTWPn67ZJyMidTouw3dOhxzGJjpf61U7TZfIVk9j0ui67GAo9Ialx5+J+rGElv3Kwde5oiiHRwaVQ/A/4GJx9YZQRASeY40EOaVXg+adPwWL+AfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458984; c=relaxed/simple;
	bh=s7BC15FAcSXpNmRg0NQy5DAZvdN8Iq3//DUj6I8VTvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSxDzdGvPRQGWzruwt5z2tGBN8yKnawmiuGwxnQMHRPMd70Dss9kc2nInXxRwS/EGxvL1uQbIEaum8Ka5Tj4A/9lLAP9eRmHZVLnP6i+QF2SSVg9rZ+mnzTURn2j5Nnqp1OEQnVxpZQWEIFEeeRq68tqM/5WdxWarZxznKyoopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z51ZTt4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BI3DhaKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHIng779770
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aWULHrPq2Zp+GR0818/GXpBi
	5WDUAT/xZEzB/ZurXfI=; b=Z51ZTt4MiBxecSM9q881uu4oxUyJpenk1Ur7RCAp
	WBCo+bM5ERXuLVAGNlEYXrwUD3qpr9OBw13w70gvfa1WOQCrEt7MB9uYfXUiAl4D
	KhV7RTe/SX6KlmpQsaESRRuDn6zCYCyR+uOrTREjLfO3cH6mS/qtLgQXfiKuUpkI
	Nq0f2L3xqQznTBQCRjalq/uTCHYkuOHTVAJlckhM0nBYAQvF7g8IrPZ7+2uB7AJq
	tYyqhMK73FOWs4R2pHH5PoMYKA4kA62xzKteuodFSWZyyl6kGkr5QhOlyH+YlH4Z
	6yuw34d4LxcmezpsgEw2tLTwzO5+8cG6FKLQP4F8I9NPLw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp1syh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 17:16:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56cd7c43f34so375982e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774458981; x=1775063781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWULHrPq2Zp+GR0818/GXpBi5WDUAT/xZEzB/ZurXfI=;
        b=BI3DhaKtLi+lc5Rx0uz03zy9Ve7Nog9FKD2zvytY6V3q1RiKH/byu4rZ6n0qr5Yz/d
         0suaXw9MmZMgpwsxicmoq+YE7T2RKQZj1FQeBKtWYqEUW8284AGE8sd49zAePd5ILQOZ
         o3JcgpFSALCjJID8E4jX+cI3g0+O0rKeWYNbykI+LSUF5JU3lhFkKo2kiAad7uSWJUym
         kfFQZgfYAYxcNQhlVSflpeIyQR45IuRykJ2Bqr4Gy+TrTs3RTsTwiD7Pa+LC7G36iu2H
         /cg11CmgEtItqedm2VrzJxb4yao/xPpx/L9bq49FbGNBPhi6i3eKVbbbdfG+BT7/vrYG
         GO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458981; x=1775063781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWULHrPq2Zp+GR0818/GXpBi5WDUAT/xZEzB/ZurXfI=;
        b=OaeXInCa3yZ4+fDQbI2Ai1CSODk2/xlQDor64ypxOjfpxSnrjb73E+rZn7ww8EX1Ck
         tvE+m0sGXihhSO/t8kUVJmy7pQqKt+qGd/JtQoCuaFR+JgFAKhnZkRP8uKr+fIVbxXZz
         drFlTT8srCIVNNeBVilUd211cR93GUjSlkVR7P9tplxzQcHjje8JsdfC5wTWWzOn7wvF
         rU7YiZvJDZrcBZA2386SLajwjv4jqk4FxmrVb7GxgplRm37BvIsQrKLb3nvbaPKjGgWf
         46L7bc+J3Zh+riExdZuEHOMbqehdoGmW+37fHR5yJ6oTWsV0QKaZqA0gC5a4Mo3mZbsS
         nX8w==
X-Forwarded-Encrypted: i=1; AJvYcCXixAsOsA19MsJGsjU09TzcU9pIrsX38c2uO+u8+bPoRVFrUz2c8apN4WlF7dclWjbOjvIMJbneRdoALFtk@vger.kernel.org
X-Gm-Message-State: AOJu0YxAgLCcjzW5VYhOxAZ0WKXm1JnGZvNNRFUwPr4R4Auot2BjRlnT
	cl82ZaHV0q/+ux1PUkym9oihmsrS0wWRLBVDrcwyBLGETjc/VTo3nd5Gf/0dQCx5+HHNmrkEajV
	W813L1Qt4HxqF7bo+H6KT611M1LQhLl/px/USg9VqvuEkrjksDRsUHdP8bzDyp9iY365N
X-Gm-Gg: ATEYQzwsYR3vHFZMNnIMqV0eHf+ZXGysE2baqWrRtCXxcmhmthUftvvRGMPhqy1u28y
	1Y6sbhGWvFUNJ3yELAh/CkOAAXZzqyXyy95qGuAdbgXUOa3HS8I6ft7CX/cZH924sjT7bAPs9Uh
	Wx0b1WQsJ9q77TByF5A2pDpFbf0z0fDNPu2PVLmy2NSyJweM0LXfk3bLeysxbpTjUia5Qy/8E89
	Os7Yt91EgsdkPvv11HKqAEruApLEEyng1HAu/5YAJebON2D5Zp/9VGDMAcKYbCYPiU2TggH1kWH
	Ga/iXJZOVXRCA92Jw93YaHp9X3Z+5KNMc8aOii5NqgERBVfqrWLshhrvpSE9IqrxCM9jCioerIK
	r3K8zLhmt7ww5YlwUCZj7/B6Dty4Q2yPZQUJa6KR6GCorlbJC9T5O75cYB77wvj/T8sNGM0w=
X-Received: by 2002:a05:6122:8ce:b0:56b:95cf:e9ef with SMTP id 71dfb90a1353d-56d220e05a4mr2363641e0c.16.1774458980865;
        Wed, 25 Mar 2026 10:16:20 -0700 (PDT)
X-Received: by 2002:a05:6122:8ce:b0:56b:95cf:e9ef with SMTP id 71dfb90a1353d-56d220e05a4mr2363594e0c.16.1774458980430;
        Wed, 25 Mar 2026 10:16:20 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8a3sm24872e87.63.2026.03.25.10.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 10:16:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:16:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: mahua: Fix mahua bwmon
Message-ID: <xj3zwkrc5fihmd2arc43cfoe6zbdkou7kyd7ihjdfxu4ywdjln@fegzffxuq4oy>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
 <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-bwmon_fixes-v1-2-9433f9d4c276@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ia_txvnGf7yeodP7JOR09WsFxh6mohOA
X-Proofpoint-GUID: ia_txvnGf7yeodP7JOR09WsFxh6mohOA
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c41865 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sIzlR-vGjuHj45hqLcgA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyNSBTYWx0ZWRfX61G1BlwVc8M+
 maPlRErgOCE65bhOYNco9IKVver6xFvQnid2Efza3iZnPe/IpVOSGbkSOwyDSn1pO94dl9dqO1I
 0L2aUd/fSntd+N/FwwY89A8QQqoSDzWvcPvjcyF3N2cCKodnjVRU9ct4AJ6ndsXDYdPFR9L8SXN
 hSTTNmMg4oZuJZvUwRjfayArT0CecJIXkkgk0q7Z/9AApJO9Q8xUAOGCbnIhw+Ztx/j1gEEJVRS
 RLA8tUOKJI0oDtujgUooZp8LlbTNTDlG40CiuldVocdIfDB0i8TVoVTFQx5+Sw0Hv5BVxf2FmZC
 321FLvSWIdzuCh3UP/Qb/O1BPD0Qc9FCiwYT2Xtzwlry5oJf57k58fzSKPl96hs84d8hw2fSG8f
 ARAjgrSsTpfUvtpVhx+EUTGDoicWStngKNy2DSfWFrb6fuG79W8GXmXzSG7mp6uomARbwD27ntJ
 m9sED2X8NzLCPAiLe9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250125
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99913-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6180329D52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 09:51:51PM +0530, Pragnesh Papaniya wrote:
> Delete the bwmon node that corresponds to non-existent cpu cluster 2
> on Mahua SoCs.
> 
> Fixes: 598eedb21ddd ("arm64: dts: qcom: Add Mahua SoC and CRD")
> Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/mahua.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

