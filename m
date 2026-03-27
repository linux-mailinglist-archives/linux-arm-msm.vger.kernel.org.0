Return-Path: <linux-arm-msm+bounces-100448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bx0AqTgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28734A82F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F1AD3084471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F98239C638;
	Fri, 27 Mar 2026 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsjdMBjU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su6BcGJL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8E39B959
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640910; cv=none; b=rux2HN/18Hy+2l6+YDNKYdVFw/oZ1TLMzQ1qAUkw6+/aER5qYKn0dDBrrCeAxoesH6hj49wG6XIDnFYPdoyH2m23Ru/X13EBUxp+J+usv9y7P+hcpVT4U7RgERBgna8qPAlzwvD2vWSBse1ysGo7BIfL7CNsVMkv+bWaYQRc9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640910; c=relaxed/simple;
	bh=kf2O+zFRh1VHxC9vCLYFtfaKn3l0/H5+4nndn0X6Vng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMXP7UVwMZOLcUKCThwk6Zv88lWlb01vynF+r4u2RHIweRoeApdV8+qlkZUxwUsSsG6i/RWZE+cMShwpk8t9UNN5fZwy0bggSswVJIG7XPWio9nHqJgCVvVPBWL/b9ntzJ38cGtel/a2oa3R0unGHFLCHn9yww3VLy2+hb2k8Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsjdMBjU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su6BcGJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2Osk4030339
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=; b=fsjdMBjUwm+cIPeg
	5Vi57L/Robb/Ahme4zcuz2/zE1UND5C88kdewbHjNbPYevUK65K0vefDAaEIkfpD
	HlhfRUEqtsRk89+5sf4Q0WjF34nw5E4sv/yzwEc/HkWWr+GsgArD5YzzzluuCC1F
	1uyeNqIaztgK8jMrcS9y3/gceBBlREa6sJn2bWOrMDDMhv1SjfTXAY2eFiYxwxUU
	cDAgeLCxoBzmk/kGCAWOg7cvw4QGG0/Slgu8UJsXEkdlWn2+s35mPqp7uXAAycaS
	1IRsp2wPHmdRlErqIwPLbHuE0Y/vgRV1zBip7y1CWYqM/fQC6LHT2M7F4wPx/OUt
	m8pdhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b0y2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so2979781cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640907; x=1775245707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=;
        b=Su6BcGJLowSZrXbHa9raP2riw9C5eoxuGUGyOjh9oPjukgBQxBX76LoqPCxZPe9sTw
         r9+cM6RmIKlbdqWWzHeXe5aOsKrwF+J5MgRHupHIBhjRPtkeuttAtZ8DS7cwGZgZBqlq
         7arxLQA7Cf18iqemaqHqoaAj30+SzgWBZaUATgM0EIvgbm4kDECLH/kpcfFCXHmskubi
         GeOglc43AkSgG21b662r3UhrED6qa0tPRIMRl8f7nMigPyLlRtL5q1Xnw+MpCqYjozp8
         nhXv9ntRU0TRloqijVW/bVfMN/IDndGLQt+Z/+ZtuRlLCn9dDMaNzM0pjt+t07VgFz3t
         Gxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640907; x=1775245707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaf+EJhyxzQmyb4o/ktKUdNiEpWBngVq9vn4kthy+m4=;
        b=Mv0ZZc0fLlcoqxwJJF2t2aENrKbWv1vozwd8zkziqS11B4TiWdbHFHLN8esXbaWEJ6
         Dl6fKtz1cHsMuCIt6DZd6eg2IYU37VmrAbjg91vlRfO8SyQ8tpaFpVKRO48SyicDNunM
         mfN7H5sqdiKC8QJlRI9xxNXRTesno+0Z3XrHaTspipzeOquobed+zGnnNu7e6q/1sEPU
         d3hjmZjY7TcuoSPd4VztcvLWBFMkiVyBO8n+L0Gq32puEsdvKLJnbcXIVRNZxpt4niZH
         z4+wov/M0t0geL6CciG5tUqjwp62COgwlF3rrVuZeBpb1/HCj7lyH5UeCRPJdHyB25nU
         q9BQ==
X-Gm-Message-State: AOJu0YxhHEKJIYgQGbu8J+9YwQ7PKHur9dZFZU+F4dxL44B4nKe8HN32
	ShqclAdtYvCcmBjD+zyvs6itVGya1V4nKTyJD/ljDL2tMgpQqglWEeHFDASiWXWpoVs5Qfh37HQ
	drzBOyQdbm43e5m02Xk7ffu+qS8gtVzFbZADtRDq+IUFNnGHCr/n+/bPkk26tf9vRoAOs
X-Gm-Gg: ATEYQzykzmIDFx5MSB8KjaTzQvJ49PNIcEZgBsa31mEQ3tk1jVazDeQxQzMqn7OG20A
	cfttUwBKvHkikOuHshL7nS69sjxkiYCggy7VtaPwOY3rlvuN71XI9qJtjdaRP78CIaxHvHBjrtP
	8HpI2t84VGvjXSC4JD6LmbH4F5C3s8u9TRavl/laRa03TjYDp7goP6Bh3eAXmJDxe4k2UP4gXHT
	cHKQGRRCvxXtp6dWzdrEQ17U1AmKOmDKCxHm8mmmGbSmtCjfl4UXgQUHIPVyjYfvIIhS3y7uTBJ
	9OHiyr0lNdnE1g4oCYqtKKvuaiFjrKgwx5Nfg+6yKD9Zcgo8FcUcHczSUra3iq44mQBDOH2/QyA
	xwNdH0br/PIyx7HTTOXQAcOG9d78lPh8ouXTstcx19c0jNNkSkHosLSjaK1Q8uAzLhszvHadhEE
	t7hAbrlh9AJWMhtZvXEGcCnunDBw6iyi5a
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr84329031cf.10.1774640907050;
        Fri, 27 Mar 2026 12:48:27 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr84328671cf.10.1774640906583;
        Fri, 27 Mar 2026 12:48:26 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
        White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Fri, 27 Mar 2026 21:47:54 +0200
Message-ID: <177463970833.3488980.46426040533799484.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6qVDyClcx_qiFDj73KpzYgKDTSfHwzqp
X-Proofpoint-ORIG-GUID: 6qVDyClcx_qiFDj73KpzYgKDTSfHwzqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfXx6NlTUaLq7Po
 6D6K4nlt4ksXQ22CjEKkEAt6fQ4JMH0+GFzAXhlVFkV1i1uf0v21YF44JR71+zGc8VPVron2o8U
 78Mk5wluMpdU3SLi+wiM3035evVt7rXxnv02OIIvTT1izXnlKz/ie/bkFjIY5cwYDSwxgwGKS+I
 vCa+BZLIVoIYgQhNCZ1Q8lPxkk+/R2JjvVV/DDXY0s2ksjptgFJpwUsn2VoEvhhWJsiJMCXOqqw
 84EH+ijvMlEZ6dWu+CPa/dyQE1siiWtGsSXotPq7bgKheHUQD8JawEt8W+OR3b4ccWJqzs09vHo
 QB8sr+c458UPB5noZ7E33elOEVx0i2r7dzFp/28nVq+XlSrbre4zG3dmI5//7B1U6azrXwGWfbu
 +dDAN6Ew6/8tGZx+93vdWIfZiIDlCBWWfOGgXe2+H+jn5CsVdTrJ3bSseb0XEQJ1bgeYSsVz9ip
 9t1UjT/c8MCwCTg+wOA==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6df0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8
 a=qwUskhSXptgb2aVpTsgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270138
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100448-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C28734A82F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 08 Mar 2026 14:48:31 +0800, Pengyu Luo wrote:
> Add DSI display support for SC8280XP.

Applied to msm-next, thanks!

[1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59f6bdf913dd
[2/4] dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1607c084b18f
[3/4] dt-bindings: display: msm: Document DSI controller and DSI PHY on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6113aaf7a5ce

Best regards,
-- 
With best wishes
Dmitry



