Return-Path: <linux-arm-msm+bounces-96527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECAaKUjOr2kfcgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:54:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DB246AEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D68703029780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19F364E8E;
	Tue, 10 Mar 2026 07:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2LeOYx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMczXr1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868AE364957
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129284; cv=none; b=UF7kx3mktBwGbaaGoSwlxWdCK8BVI694sSSh8nDRpXP1FinR3btyGgdUyDVVcccW5+16e9+mTXKx6bOWWUxsHhxH1yPkwlGD4Ej1l7rlr+GhtFPea+3IOP11XG3W56Uy+G1rJR2xvJV/Rl2HeexNqD4zQ7W9iMRj5cGnlwuDNsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129284; c=relaxed/simple;
	bh=gNInfhjd6MISyIxpaQFrR/jdhlcl9F16klySSUxMkGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbHXs4J//xNlvaJD8T9YNAD34S5W4GDz71itl2KFUQqhO7mguKofdcCmFOxYlbKEMGbOJzZtXNjO2Fjaed/obosDsBAF5ADNX3I96mQfwMxTVNmz17uVywlh8DrXtJ8d4piQqpmeh4y+bowNahoMENOvkHsezEeUJ/7+ipLhqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2LeOYx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMczXr1f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EJsl247053
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+0oCbgUSnbR1XCQY05IPXN3M
	te7+uEnIM7kPBZI0/2M=; b=Q2LeOYx8VRu5+XO2x+zpD/h1ScmVF3mIRHF+m44H
	Hl49ara2cSreUZQQ6elDA7NLKjHl4UE1fnRBkt7SumHsn5MYUZUckYlPjTiflhvi
	x+oSdV4oolnDKjw6+m/SsqZnrGMawLPTuDdMt/z6TeYYFsS88qG4w4uoXLMzMbi0
	C00jyyvgYU7pcY1qArmz/CtxZ3oDzaeBbCHML3q8ulysz3FlyqLJ+N60Sh/XWVgf
	Gk6koNnFi0ZLVCOGSa2j0MCzi2IOQeIj6NRZKSGaLrkVp2eke1M+YR+trtei1d6F
	xZcrEg86nTWSmkMkhZ+ANnxyerG/Ezn/KI3MMvo57GQAhQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8801d7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:54:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829a535ad50so1542151b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773129282; x=1773734082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+0oCbgUSnbR1XCQY05IPXN3Mte7+uEnIM7kPBZI0/2M=;
        b=XMczXr1fPF6FuvxKlUvVmTs0yXBYJpl0X/Xx1T4n61GYCVwbUM2gOhGvhky83H2OL/
         /xr+YY2xsovfX5JpHsNkVwwWlm7gxHn9Ekwt+inNFbhnFTnSs/Q9ZwUcMHEFAmdl3flX
         p1o/CkLF1cWf3g2ome8Xza1MMkoLok2ZjjysdNUXYP+xVN9hnXYrmIEOL9QXZzfx8Tdq
         Tzw5Zxw2oFutUdRzmiHatxb72B+6NviLY/I1Y5BHhG/zmv7QdRa0umxNYpCxzcqi/ZAs
         5tD+JDqutSijKSRunOYMu0hOd9lCj4Zri/GRyiF9edb43Idy7ZDhTl55vVKBdkVAfev4
         TbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129282; x=1773734082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0oCbgUSnbR1XCQY05IPXN3Mte7+uEnIM7kPBZI0/2M=;
        b=rOdnO2nZIcWKPlPj0HGOBgcsgHZp15n2Y4iY3yxBbIxUPHDlEsxCcOYQFHMeCxG181
         fFwVN2XxqOY6Q8XdKNhaGYpeDbEQTRRr/Q+nsmp83XiDf2kXV/xfF4unHB/twJVdvQbD
         FXL7iiwxPPBHMLSXMSLrRuIsmTjSSDrxsdgmloY4QGEeb8XcN4waCA8JXS5yYp8CUWY6
         w1ya6oEVKD3K7biWqMO7O5Lc7TnKKvhqSmgoQIktZ79gu1r1+hYGQHO+dC71LFAY+Adq
         PXtBWidtq73oHhinSCXhwY32dBX4tEYCJadB7HZ7WmoTW43/BgowkTFbOfIZEt2UWSIL
         zD5w==
X-Forwarded-Encrypted: i=1; AJvYcCXKRI0U279JnLOSEkZX6+2VmQJ59i1URORxTx5oerUsvqjNw+hIQCVWi8A3XwdCA0o4iwNKWsWh2HODtmMw@vger.kernel.org
X-Gm-Message-State: AOJu0YxWebP8LNpIeF8eM519rRborBFPKlVqrO9JxJn4jQAvdEnBkQ/q
	tD79pYkT1Bs+Qi8uEVAErivNaoBQfWh+Du5gkL3PX7nIuIl+ICJ5OuzE1ep9Ee7+JNxO8PQlci+
	xqFBZ+MGRWnROSw59hZcWBTd9F29P+6BsuoFaUM6d9YNyR1B8RjX8zjIcXbtq4mqMK4Tn
X-Gm-Gg: ATEYQzxCuUKFj1507eqJhYsgG4ACEYqaicwAEUWuNDLWnbjPuw1WOHCIO0kaFt/DkQn
	Xv3ikjvHK4U3IBFEAlm4BVT4RHdMLj3Nn2UlOabxIP1Fnloh21b2ovuyDBwB1pprVtM8Qn9bXhd
	sret+vMEH2t6YmtWfFPQDV07BWMVgYe29PTTK+y9M6oFq2joSCBQQIGpTzgEvUE4m2adOM0MsN6
	v8/2w3ozi9TVCCp5m3D9s9f4SD2YW5KcELrvC1pte1Lde9eA5scnMoFNWnkxGcmr4p4f3rStldh
	B1sqEEjRV61MMb53u0iNRrDobJwIr9aVKHsu7TEPLFe2x67nVGXXecTqqbdEjgYqasZ9webJYLz
	qjxoj56rvH2SV3KEYAE5Pp3idfLcNRLAdNYTVGf9KW91pUaDX
X-Received: by 2002:a05:6a00:2e15:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829a2f8be9amr13946867b3a.52.1773129282130;
        Tue, 10 Mar 2026 00:54:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e15:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829a2f8be9amr13946849b3a.52.1773129281470;
        Tue, 10 Mar 2026 00:54:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4635d62sm13060340b3a.5.2026.03.10.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:54:41 -0700 (PDT)
Date: Tue, 10 Mar 2026 13:24:35 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] slimbus: qcom-ngd-ctrl: Initialize controller
 resources in controller
Message-ID: <20260310075435.sshej5qbahcyjxti@hu-mojha-hyd.qualcomm.com>
References: <20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com>
 <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-slim-ngd-dev-v1-5-5843e3ed62a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2NSBTYWx0ZWRfX2pvuHYYYxDGB
 BW36iuJlMEC5ZzlCdoaVyTQS18hkB4bAp89dJS1VtwzoMu1QmuMZYIu4vVkzgpIUFg0Y68SgQDj
 T8CVS2bKaaN763pIMhtp0cJzLINbIhhkvW4odABGSr8RftvCWdU5bbQZhMAQQGzmzm+siZ63RaT
 pvlMDVHF7WhLSmTJH1MOtpBM7rhzaXxyahg+BhQ/vqvzP2xdVYkwFwxyalvo4AiBPkSOYyj3Oj4
 mQCRcxWMUTKSqmh78hiAfWvVeM6tedLbIT02cAkFCiNynxOYSeHHrB1TnTnS4CC0nH9RrXKD3Q6
 b4HCp/3MGudjtIBq/qT2/erc4RVW3x+y7PGDggUeixISjELJLLKUBGyQI1Q6BPpvx49Vt5FhvrR
 Q88MpaC9Ifn1Nm4baZmly0RWxlv3aPI7xlRcUFEk4JcxNqyHF6TG3ObHlnM+D/EGWyG6YqkKGS/
 Fft71QxhLhEolw0MXzw==
X-Proofpoint-GUID: iBP5Fbrqpmq_oE-CcrNCOI1Q5waBP_A3
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afce42 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gbuOVpkGrxRoZeIW0QkA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: iBP5Fbrqpmq_oE-CcrNCOI1Q5waBP_A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100065
X-Rspamd-Queue-Id: 056DB246AEC
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96527-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:09:06PM -0500, Bjorn Andersson wrote:
> The work structs and work queue are controller resources, create and
> destroy them in the controller context. Creating them as part of the
> child device's probe path seems to be okay now that the controller's
> probe has been updated, but if for some reason the child does not probe
> successfully a SSR or PDR notification will schedule_work() on an
> uninitialized "ngd_up_work".
> 
> Move the initialization of these controller resources to the controller
> probe function to avoid any issues, and to clarify the ownership.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 38 ++++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index 76944c515291a62fb9cb192bec5cd5c2caa542f4..d932f7fd6170773890f561e3af444ac2c5730338 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1584,25 +1584,8 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_noresume(dev);
>  	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
> -	if (ret) {
> +	if (ret)
>  		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
> -		return ret;
> -	}
> -
> -	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
> -	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
> -	ctrl->mwq = create_singlethread_workqueue("ngd_master");
> -	if (!ctrl->mwq) {
> -		dev_err(&pdev->dev, "Failed to start master worker\n");
> -		ret = -ENOMEM;
> -		goto wq_err;
> -	}
> -
> -	return 0;
> -wq_err:
> -	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> -	if (ctrl->mwq)
> -		destroy_workqueue(ctrl->mwq);
>  
>  	return ret;
>  }
> @@ -1649,9 +1632,18 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	init_completion(&ctrl->qmi.qmi_comp);
>  	init_completion(&ctrl->qmi_up);
>  
> +	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
> +	INIT_WORK(&ctrl->ngd_up_work, qcom_slim_ngd_up_worker);
> +
> +	ctrl->mwq = create_singlethread_workqueue("ngd_master");
> +	if (!ctrl->mwq)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to start master worker\n");
> +
>  	ctrl->pdr = pdr_handle_alloc(slim_pd_status, ctrl);
> -	if (IS_ERR(ctrl->pdr))
> -		return dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
> +	if (IS_ERR(ctrl->pdr)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ctrl->pdr), "Failed to init PDR handle\n");
> +		goto err_destroy_mwq;
> +	}
>  
>  	ret = of_qcom_slim_ngd_register(dev, ctrl);
>  	if (ret)
> @@ -1685,6 +1677,8 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>  	qcom_slim_ngd_unregister(ctrl);
>  err_pdr_release:
>  	pdr_handle_release(ctrl->pdr);
> +err_destroy_mwq:
> +	destroy_workqueue(ctrl->mwq);
>  
>  	return ret;
>  }
> @@ -1697,6 +1691,8 @@ static void qcom_slim_ngd_ctrl_remove(struct platform_device *pdev)
>  	qcom_unregister_ssr_notifier(ctrl->notifier, &ctrl->nb);
>  
>  	qcom_slim_ngd_unregister(ctrl);
> +
> +	destroy_workqueue(ctrl->mwq);
>  }
>  
>  static void qcom_slim_ngd_remove(struct platform_device *pdev)
> @@ -1707,8 +1703,6 @@ static void qcom_slim_ngd_remove(struct platform_device *pdev)
>  	qcom_slim_ngd_enable(ctrl, false);
>  	qcom_slim_ngd_exit_dma(ctrl);
>  	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
> -	if (ctrl->mwq)
> -		destroy_workqueue(ctrl->mwq);
>  
>  	kfree(ctrl->ngd);
>  	ctrl->ngd = NULL;

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> 
> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha

