Return-Path: <linux-arm-msm+bounces-99061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN9cMU4rwGneEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:47:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 401CC2EA39E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65238300C83D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E56371CFB;
	Sun, 22 Mar 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYqhs2jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQNY2t6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39312741C9
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201670; cv=none; b=ZrYhrVr3mzm3XaaA2z9LCCSS3J6GKL62xoFMyzkfB4d8cT5SqfmIF/ZUVckz8rPPsOQh8xSaBYsxJ8U6EkPlYtK4bSIuIpg9r4B3uE8IoGdP9t7WFQ9p1DccHKv5kFJ8vkH2wm3zXKU1CkwPXfPug9LUOpxjDtXtRz5C7ZEzMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201670; c=relaxed/simple;
	bh=qHfrcSSixlXz1JdxXoVKXWLRz9QrW1vJKA4xePfpd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnX7x5bVB/PtFgTi4G0UJDM38eFK99h4unBX+GR4PVddaaBgnXhOIBpm7j1z5FmbffJVgXh27ceEi9BccKqIjC4sA9MbrjK3HFeB28NjEAd9D9/tXlEzjDThwn//QRX/dVpaERS0iaRrt21Zao8SIXwZPfGSa6sB0il6f0sh/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYqhs2jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQNY2t6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7m9Bw484343
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pi3yz4utIWc0wu4B02g881LB
	r0MDES4NNN5SFPyCDHA=; b=VYqhs2jh5J1k9WuLGBaocfBy1nuc+b63TOoOW8SE
	JaMh32QZKEYxbvK/TA4zMrf8tTM0wkPxLdNp8CZtBxbBfL07OHplcyJlOJrRlg6D
	7lGQ3efZ7ODvowILop1JCL4Y8SQm73hLKQ28TNwYjtrHNQ5h8iLA2NVCvaKsxich
	ix4eaGbv5VCqBUDNExOl8nKTUvrqvtlWYxzdaL+AeyHL02UnIPkledAx32prlCE1
	ce/pWQe2w3bPspe/ko4I3jCN6UKHy/yCqU/cFHOk8SNmfG3/+OjUjZ/iLVlnaySY
	jag/Eea4VvZYcn5gIqph7bPFQI0sle1tJfcskSZB2lKmjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1m3ctmxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso502051cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774201667; x=1774806467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pi3yz4utIWc0wu4B02g881LBr0MDES4NNN5SFPyCDHA=;
        b=bQNY2t6G/0rAkgRDp8rB0qwuJ3dR0q6fSDboqWC72x2X0/EeTLOqM9QxS8qsRFf7Lw
         CB4T4gByGdwz8TEsk8+WaDQa0LkzCwb9B9fHozmUkDtQB5j9ClG8EVLOkF8n7AXxMswj
         9DIOqEkQVMcAD5b9WYRt+ZAWZyQGd+ER/xV52RmV0JzU0Wfbt2xeyhQ5yDES7nHdJK2X
         ELRdDUQix2yR0hcLIxc65lamNK4mg0z/qWIkctY9lABT1qxYGyhyn/r0Yf2Ssfa+3nK1
         Ger/Dgld3MyqYukzKweXcnvob6B/W2HUsBkF33HkFCT5Dy8HMon5Yd55Xm4cCUqNgGhg
         uP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774201667; x=1774806467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi3yz4utIWc0wu4B02g881LBr0MDES4NNN5SFPyCDHA=;
        b=qtmNMDcpm0R35Gr7a/4ZZQTU6kcLvSfUxYHxzrQM51AYQU9R4q3h/eC7ECorPFjYPq
         Q+ahALytK8sH2MDaobGCYvvbvpeLmD/FYQWqqE97bEPwBgDRvNbKYYLMmqukeX2taDl5
         4fU801y8p5i09EeWfKWN5HBG1hujLTgjXgA4NYi1PqTl/57pLvHao90+QSraERTRkmhG
         lBE6VTSQXaL0TKZwmBdcu+xAmCYd+ZdE9EGbxdl5TlNcea8ke4h6IJS3Cnettk0mrCK9
         zQm2TM6rD9CZoFYMrjog4gWUj5lm0CUDK7NqvNVDNnOA885MEyioXSJQReAwsSp5sJ9s
         JYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlbunGm+Y2FgzG02psyR1cuY9qSe9JVNkvO2s8T+002cZnB7QppnxduLFYhsyUNk0K5/LpGQd5hJrIIPn1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf9jcw8VAHoLbucYhVbaMfEthqk5gCbYQKE2h4k3nE9vV0mhaF
	1C3GTDoVgZ7/jNZOYq2NnjwEXTyoRZRIlFnAySBSs1AZLzkLm75sQVh0DKCGaVuCP/8pGGdI8rR
	J6TLVrbsF+dZSeqpeU4bpYwyBcuXCYcp8JjWVRBJfPBiJfwcitHgc9KaXhuevhjg/ZMDA
X-Gm-Gg: ATEYQzwP5TMWAscBNxgmgp+uo52or4BXja3W7T1JwY0pNXllZFLxYD6GFZRgPL0AFu1
	/NYl9q56J8esUHpIdoLdPMRMmqB9f9okQ3VhrmXKDEviBKmtE2ehEJTosGgvsITD49R0rMNBfb+
	Prm/LsfBzLMDAZBk8enx9MbUpeyuKrFwMvh5seFnF7PUCR7byKhhbOg6N/Sn78+6nnmq7IrJ+LB
	V3kLWx8WcRckYrGISvWZxpwhcVAr5oG2yjAGfWwEzBF3O4loSs5dPCVx4J1UkTLY9Wi2p7wHSL2
	3A1bExP9WhrIvzHboKqd8X+J3rGk54KUvuyba08mi+2xZYnF2cdS9NiQ9xOeRsEiOO2SckZ5eit
	wB3qrkP1X95eA6zQUBnzTAUC3CFhV7BJzPhZRUm8+Zi6vSB3ndv/nCtbFeK5wqJPBPCZuZRp45V
	qgu3KhJMTPDS64HF/FEeDZ8ahMx7j3CJgiftM=
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr147647911cf.59.1774201667113;
        Sun, 22 Mar 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr147647651cf.59.1774201666657;
        Sun, 22 Mar 2026 10:47:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd55sm1901747e87.72.2026.03.22.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:47:43 -0700 (PDT)
Date: Sun, 22 Mar 2026 19:47:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Message-ID: <5ucl3sxq4nypw2kp2blcipnzbdtellpymrilbxkbhbjrwjdbth@gpass2a2rs6u>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
X-Proofpoint-GUID: uytIf7IZYR3ImFw8NqRA32-xUTDJd1zd
X-Authority-Analysis: v=2.4 cv=Z5rh3XRA c=1 sm=1 tr=0 ts=69c02b44 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KXIq5dYrPAAvaokCsYQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE1NSBTYWx0ZWRfX7789up8YsAIQ
 +Hps5HfTpjH4zbmVrXX0KIsCAuezglEX50I8JnQvh4OiUS4FCjo4eZ97jgwHQ1mqmfJxyGbWnnO
 +By96+fqjIFVvJW0IvC1k6ObtCQ7sNSIVHU9mzko+0QFaPQgd+PW+4gLse5B4BiZaKjQFWhAGge
 U876B4JbxnoHkF4iNMiAxcu9ZqC0ZOeOonklwthR49poP/6MCKkXix+tF9PA2p2nc+wz3hkc0Xl
 AtXCOJ1KI+yx311ACVMdKehgbG+VFPH4Oool7wmUIBWOtNcG7rnbFI/5LjNz0nkpJkKVCx9TUob
 fNA6DDqpMEPSpyGejnqpgQZyxwL8fVXYbVyklppNWPqG+0ydhgH67CuViZ6lTFihzXSM5tOEi9t
 5YgurvOzaEAEMbi1+ZnZl0Fnxs5UX+KTMqZZlaHw9SfkG3kt7mh916d9FDSEOVzIhK44QWUwxAn
 m6P+L+lSzQi7Mw0gghQ==
X-Proofpoint-ORIG-GUID: uytIf7IZYR3ImFw8NqRA32-xUTDJd1zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99061-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 401CC2EA39E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:08:19PM +0200, Abel Vesa wrote:
> Some coding style issues were raised during review but the devicetree
> was merged meanwhile. Address them here.
> 
> These changes are non-functional.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

