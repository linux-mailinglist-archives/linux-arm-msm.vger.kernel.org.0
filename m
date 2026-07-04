Return-Path: <linux-arm-msm+bounces-116442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 821zBqdRSGrIowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:19:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B67063C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:19:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pu3uGO+j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UrnWi+mZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116442-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116442-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52DDF302A526
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068BA17D2;
	Sat,  4 Jul 2026 00:19:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B328613B5B3
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124388; cv=none; b=BXpjCsIBqP2hSuNHZDiJZ9M8ELYQ+qGQ5kZwhXJY495EgHVSoH8gyNrVwKubv/1KSJahW2pxC/WIKtKMKjlkykwWbTkpR5yNXCljG/hqMRiwNzuQKR6bCM4cvnDdlhZ7MNEanUQlVxRG+VISI1DsWhKkEpUB9gxquqwrXEHvh8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124388; c=relaxed/simple;
	bh=FkkpdWAUNraBzi5dASDQ+g+cQTyV0v51VYQVWLrqPPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRDk/rwCXv9DJxXwkKZPAR9g6B5biuGcO3ij4rbjuzwFcGCwLfcW2NtAZNGi0lQE8GU+wHe1iKvn2ddBcVGCNT8tB+2Ko5O/nINCzzdT2Pa+5HHUy6Pl4ts2fhCFy4qAX3dkg8hAkmH1bA/J98MADtY60RB7iSpVoZiLzH1fyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu3uGO+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrnWi+mZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPig4872061
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jsHH6Scg4UFpqoXTrp/Kx37w
	2IUpCuCyL6VPotB9fko=; b=pu3uGO+jEWzmn8T02xYDZ9lWq6CTktfPa0RpjlEN
	9ST71WrcrXSofMs7IXSquKebgHfa3vHcimoClhdO1I0bwLN9uVyVeOT0gs8jeS3O
	dOugmxHL436/wAlExJLqcOSG1imLSk5rL8C+jnloxbRdhk4+D9X9vsH68M5DEJWI
	lS5iI5FP2v3Jy6Ln1pCvJIW6m72UwfinyfhUMPRFMaBDIe1uphV+GOaeKvoX52Dc
	kuFADmgSav9oHGLUqLk3w+iwyJWwIxPAXdX+44YBtGV+rf9/r24VTscdlTHZ3lYG
	7vC0ebtF6x8+8aWa1FhyjlqE9OKaHwz6H8GgAWUbKHHOyw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4c5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:19:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so11741076d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124386; x=1783729186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=UrnWi+mZh4y8nr5RGq1l9hvuNxDWbW31++/hzhYlSW+C/GuaXsImrefXS6ek45UfkT
         CLTHqeBIVt/ao0uWa/y5nW7ZLwdPwYPYqMhGY1uTzMTDLzDlCsaFbBYcXpNvMn/xsjPw
         aT731EYBmQPoeR7fALo9BF43rG0odIbQdcpjfxXpty4ljx81wgc6nzEUNvmzSdnzcGm6
         gEtmSN7SRMdoeiJJA/tfrtnwpVi3aNdTAgR/ogvhNGzEh3mzAipwy7qooasICVtEnZsy
         MjFiVNcrWygfvgEAkGJX0Rbg3ZBiX5G6c1n2EIv9FlKF95qL7cmb8GtScrBHY3fqbjdK
         xfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124386; x=1783729186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=Oz8YFVr/wHEgKMGvuAA4wi74wBR1phYr1opGEyBL1oQG2ybzCyct+YB1sezDnLAZkt
         5c+ntRAJ9OL0VIg3mvk5nbqmoB9Vb6zpkUQy2/4dZ+FQ8nimsRUAQH3k4gyGid7RzIMn
         /llM+d+qjNj7k2knG835vRH1oUAtFcPo1vtELh4Jm4CQmdKwCGl6jbcMpmR99nm3WAXP
         yfIITdqrMOYE7N1IvKlnDMR3OBp3jiaiawQt2r7lmJnRNprv0O5ry/XDhKVXrzyBQelC
         0hp8NY5j3Vxe1SH4AkVOeF2BeP5TqJRZkgXLhkobNhwm3ApTEpM9MU/uJmjdLj21ODgF
         YrfA==
X-Forwarded-Encrypted: i=1; AHgh+RqbN0wqY1PDkI3KXWyeOByRXZIIluPaNbqhS7hHE9eNJqGMgsCIneywbaQpPGfyLdoj/WVNuPytopFD1XLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IDCOWwpmGJBe6EmLWMwMR3kkVekEhNxv/Jw/pViCsClcRrsQ
	3YKJKCz86Cq8pNRUCjVUTdpmnTeBjTJGK1e5/mOFpAM5fJ5MjzEyA4a9Pv1vQx1H/uGGpndlUMW
	XFieWxTQtgYQYbK1s2xOWVhZlB+yLKFkfIEA8YXXEuKMQmNXl9/T6ntuOBG43TDq6wKac
X-Gm-Gg: AfdE7clb+wbmQAF9yLn2cr6KXns2XGji5hRS8lZwojR/gTU4mCCCiDgdHgKrnF8xwsR
	ruPMvh9hATa8Z1Afq4kNgEJcJmRXKwkj8VQfs7jBKmuTswJKBlGkpKtuHlZ5o7PhBF4xGg0JSL7
	D9aa9meBGwOKQPCEA2Z/s3fL0Cuvmo5m6cSCJpSO/hrXobEy9jfGbxrsHeVsCafu7Ctk2J5TbLx
	Xuw+W0itI6keGov+Xq3WJsx2eMx6HefjMEU7cXpqytg2gpZ78hBMXNFNwNJaO1qNTJdvsMbVdzk
	KPYOrEd62mW/RMx3sodEQBez5en0ul9nVVQklSm3eOH/sQpLiJMoZ5yvuCGdfCZjkKsMT+VVNu3
	5F/rzx9Twq4wds+ZzLFj1Ji1hVC1NcemVPSTdrgi46ae8k6wBaQVe92UAlF7iib3WAbQ6f1IsK8
	jpbG/d8JXKmNiW+zjuQDv4dRNj
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21234206d6.5.1783124385734;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21233776d6.5.1783124385251;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm864403e87.45.2026.07.03.17.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:19:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:39 +0300
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
Subject: Re: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Message-ID: <yetssi6x6buxvjeanwqiigtclvr26djkm5j7kw4cdqsa5k7iol@ygnl5723bjvb>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXy7udRinrBe+F
 nCowEQU7cocC3KdPP27Heyh9uTGik1FIBb40NaxmAU2qEiBlO0SKGU4wHKjCsku9iYwU2vv64U7
 JZKZY4nq2c8D60VTZjFIsiqz3/0kN9I=
X-Proofpoint-ORIG-GUID: 2WrTMKGTi7ws_VJiNZQqybZG3Qeab39u
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4851a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=slVkNxoZvn7uzNb-wxkA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2WrTMKGTi7ws_VJiNZQqybZG3Qeab39u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX6dP0xlLyga1E
 tsJcxfUtsZV22CR+zWCcLUIcn6qzRHoI4ddKLQlxgjZh8QfA5a/00ak4aKiJzMtO7ENFvZl2IBA
 7MRctOH/5Y1Sr493pDhi7/X6QrByp/kGBKGtjwTp0tB1lov9L/W1/5fUb3nJq+4B0K5adcwR2Th
 lVbhIUEBsvWFcYpQwhxV4qzqzcNNX5vZlx3OhW0aPa2PJTMFeOCpe5HvuLGLFsatQY1uaCAcmeZ
 rUuB1ip5ZgtQ3Pu2NHayKmAucyrnF35dTyRa57+w7g6oWLHPv1cXwR1z6Y8v0V7rfjtPcwrnE12
 /9bA0gLVza3bv/Sdj4T0XBeuwen/arXBBiwnEIayhe0U6cwTF3+GcB8ytI2KTEBIuZsIjGB45P3
 HQyQmJswA0dW4T16y8VtwxfDno/KEADc7wrUME58sBnc1kUaQvLv8rL8uFym8AoBy+huX9qC9Xf
 9OGOoZ2qobA0WySrpDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116442-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 859B67063C9

On Fri, Jul 03, 2026 at 12:01:34AM +0530, Imran Shaik wrote:
> Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
> clocks are kept always enabled by the GCC driver during probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

