Return-Path: <linux-arm-msm+bounces-102696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ADzOvkd2WnVmQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:57:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CDA3D9EDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 17:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F6D2304120F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4143CC9FE;
	Fri, 10 Apr 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqL9tOyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjPVtr66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2543ACF19
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835730; cv=none; b=Fke5ReD4S3Xz9FOrv9pG/1z8vb1nzW+bYR2hq8TDdEI29cb7m8/Wq6WR+LqtGrX8lZRM9Qrc2GZIIlFc72T+8JjtVivgOhyIhYE/6cHh/83RT/PZclyaDKWu1JqVRGthbA3MdJR+lu/oThmtP7ngBeOmqh6zk8NBzxetpf5XF7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835730; c=relaxed/simple;
	bh=xIVUY+Pbg5/QfKf7tkCdKCtUq81gJSTuDxFQHY4fwOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDtW8YJrnPXuGyYJSAJl17rVOdoo9tiyBPCYreqDtJUVyxLCqtgxFBWjNUG4JRyV+UEwIREHUdz1KtaThi/GQfGgujNDCGGelYFwIzz0DRAjBJCpw2L2DgTVx2Fxhrz3NsEx03f7Q6KPIQvmvmh4ZnHuHFLiM6AWtwxISgM8nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqL9tOyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjPVtr66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AApPjY3743239
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uqIH26VW1DMf9T7tCXVZqQOX
	a0zE5Lks7d0a2XG7EJM=; b=OqL9tOyArpbnVHCfupxXUVAzJAmzzWPrObveAXHg
	dcHRlhTD+emIPU0fbVHmKp3DNXGAgBRvzJ34YIM5/MtndovTK77DdDNVaoByJkV0
	ZGgqK9bty1/mSsRlymsWRgQI5pVdAmFObGVh0gTNBGs7LlHDiGZKNLtnyftqtgcv
	ANrg0WDgiQrHX3Q4QbqOQTaUryDxsV6x4KKOX130fgNfuTlN8e9ZigkFxQEMHgv4
	Ps9mqJa3DMt7GYkY3WfikZYe54TpoQC3e9WinQiqS4bLcIFVZ5j2rhLeAie2q+0P
	JPgnMjoTxn7NavB1n+qLGQzgIm85mz4EB8gp2sWXqxDlkg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytngut8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:42:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1270dcd11c1so3260012c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775835727; x=1776440527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqIH26VW1DMf9T7tCXVZqQOXa0zE5Lks7d0a2XG7EJM=;
        b=OjPVtr66I+Kedymg95P4S8e7s7M/GrI27DHNWoQIbMojGy0lot1CqDWO7oy8HOSNHT
         QaRriAhitWuevcmW5f8xnG+A5YQk2BnTXIn0wPqeIAd/id+lucQN69b/CCmL38KrAbkb
         Ja/A2PSACVoDZv7G/5ofzy6xpRJfsfW+GOZutLEBW9eRsf7qi0bgQN4yFN85AMFNyx79
         s4kFJ0vxpgioBp1f6KpD4GG3CyWLAJ3WRFRBQvuVVdZkgc+NsNRPCG7gXjK6PM9AN7WK
         HYQSfhfBpEC/W81g4v1o19ZLSWnr7rmPBUAK+W9ZJkSrz4NsnLa/qQZ2OSmD9d2NyYJJ
         qQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835727; x=1776440527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqIH26VW1DMf9T7tCXVZqQOXa0zE5Lks7d0a2XG7EJM=;
        b=V9hLUYB+0Ly7/rYuo63+ybTEkIxgvw1oU9dQTtU0tkLO98TC0J5XRdgpapn90EhNJn
         LeRsZpywRJMmFqbIJaJud3+pQ2TPD5yP5PehLqgKimgIq9h1EO/Ui3Qs+QyWkSNcvTHv
         axe9HUHmdc+1aWdjgFXqJKTweSc0ld0C+ZMXAjaKhjPH2EjCo5RTRZ0K4gSlN4sOq0UO
         cn8uLyqqyaJ75epbME2SynacSPKpRQ7Fn0AyMiEM20yDmdiDdGI0wWucrrflnkxp6jtP
         vIZHaRbGDZWp+E93WpbpqeDonV4hUbA5Q/bwA5f0HFQJc0wEuAzubBeq2nxvmjcrbq+t
         Hexw==
X-Forwarded-Encrypted: i=1; AJvYcCUnA8QfOOJEmh/LB7j7Nj/3YW/SLSiV2DTbxnN3RavasDXgu2ZJtrFNLiyYdvC4yv4Yjcr2d3forBINS3h8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4mtGi0qVUQxISgU8HMpby25RPuNOHAI2hyPn6LdcqNBZ/Jfm
	aSwGSrrBukxJYGLQgceppiz3c6LYBxx3YnO23ReV0Iqeq9FtMIi9oY/4qebbZRvQUFWabOy+5c9
	EQzA2bKHBx4kmZbvpz+AxVhA6/09UX+iI7G7xtC1OXG2JpVOikR8NOeTwpALvesAHwiv3
X-Gm-Gg: AeBDiev4lfNabWSVYl550tyQ+NJDAUqsTETnF/1d6PrANs7CeGIhsEvSEDhIijgkpfi
	Dh/Az0E6wycVq3gMP+YEzOGVOead0+Bkcp1ni9GiqVRHll4IhdCJ02gJOdoZIATvOgZsgvdtL4F
	hOmJ5wTFC9rVP9Yb4FuzFHNdWITggbjB3/yBuiMKnO+t/DyI7ph4LAiDred4O9DOUXm0mt0ZHXv
	BToWsTk6xV0CCRaJHC+JwVfnSnd3RA/+5/zkfwzo9qEqYLrF6/HERcCuN54SxEmfnBAj9qabb1H
	Z5fSrujasJZlE41TWhOtnM8luHpGfJnkdsLKqLl/bRfC7k/ljyAPnEfEQ6AUXxy2IB6VqrZYWyt
	0RrN2rn5j7u9lvtplrT0DnhOcYeEUJ/uhX4LHzBHqDDCnzps9Qg1J6ckvpQu4EUySS5L09p28aW
	M=
X-Received: by 2002:a05:7022:60a6:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12c34eee7abmr1952886c88.33.1775835727011;
        Fri, 10 Apr 2026 08:42:07 -0700 (PDT)
X-Received: by 2002:a05:7022:60a6:b0:128:d9a1:b68b with SMTP id a92af1059eb24-12c34eee7abmr1952867c88.33.1775835726421;
        Fri, 10 Apr 2026 08:42:06 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm3838370c88.15.2026.04.10.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:42:06 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:42:04 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interconnect: qcom: document the
 RPMh NoC for Hawi SoC
Message-ID: <adkaTBk50KYo7XEO@hu-mdtipton-lv.qualcomm.com>
References: <20260409-icc-hawi-v3-0-851cac12a81d@oss.qualcomm.com>
 <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-icc-hawi-v3-1-851cac12a81d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5fqJIII3dgIsoLctQQq7Qz0h1nMHxblV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0NyBTYWx0ZWRfXzHL82k2udFG3
 GzxQtdwYupEN460oHm8ZnacL5jLpZScC0O2KCfXi9oFrZdP7wMt+vH5Vzi64k/LE4DUyp4f/9kg
 yCjt1qikhDTUNly/Fb1J7BTIY8g1DHD9SnQ5nHZ5UoMHC4WGvLlNzSBg1WGjlTG7i4LvsBwCHwI
 cdXgp/dtle4lkfeWP0Z5qRef/tK0vG2+VF0Wq77UirEzP/dP4Q91vtpaW+9+BjxdVGdicmKCbz7
 KELbrCk1Ab1mJKs6UWZ8FLEXZYYb9ykFo3+UWLNOuG+9pqkSJnrSdQu/vmHPdRDgCsiALAlV9mN
 eUQnFiE8lmGUMqaMR5kwb/mwtJvq5WeOyXuiDIjmWvmc4kS1FxRZEE3nz4Wj9SwWbCOpXB2kiPt
 9OfhvBK5Vi4ZXJX4Z24unV9Fn+DLuz7Xj9fv7T77PizkBz4nCV5oc6GePverb+PZ7ktYoltcpq5
 x6y4XUvxOSUM+k5ITIw==
X-Proofpoint-GUID: 5fqJIII3dgIsoLctQQq7Qz0h1nMHxblV
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d91a4f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=leQ04dn23ONfhV9bpxQA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100147
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-mdtipton-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102696-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 94CDA3D9EDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:01:37PM -0700, Vivek Aknurwar wrote:
> Document the RPMh Network-On-Chip interconnect for the Qualcomm Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/interconnect/qcom,hawi-rpmh.yaml      | 131 ++++++++++++++++
>  include/dt-bindings/interconnect/qcom,hawi-rpmh.h  | 164 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

