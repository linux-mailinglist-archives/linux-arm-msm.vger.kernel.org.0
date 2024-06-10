Return-Path: <linux-arm-msm+bounces-22167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61065901DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B8221C22EF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D3F7406A;
	Mon, 10 Jun 2024 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CG4z0Wcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A76F312;
	Mon, 10 Jun 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010456; cv=none; b=Sqp9FDlhP+uumH05qp//fQGgT8iZgvTYtDAU5O5ckvrUVg+clFj5A0qQK2pkCkQMv6oLLYa69ZwcPMUtAz/UqDzy8TT1swH9E7Hn5vLFGoyAJryULAHsV2ufoP1EOqxlKwIiU5QdQipyD6Jks5e56V8jE3Rz8ciXsdVgwl2kUKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010456; c=relaxed/simple;
	bh=JSqRKCaoFJfvWl9rGqn3Ls4SJWDfPaUg9xSJDo2/eoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dMRtEcSB+Ve64lgVAqceDSSl081GEC4mgpwVh1Cowx6oy28ABnQ4A1m5IPdBYEaGn0Y0p1XksAqYiYmpNnVydqfykJEUVCuYEgUCLMFOGzOWfho0AUYkvnYzHHwZdqtBGMHfoOTQlug7aOME1cCQ3/23Qrw+ygcz+TzIGCQ8uq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CG4z0Wcd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1gQDF020164;
	Mon, 10 Jun 2024 09:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSqRKCaoFJfvWl9rGqn3Ls4SJWDfPaUg9xSJDo2/eoQ=; b=CG4z0Wcdtm/nWtYU
	yAsJnG1AFV9KXly7HVXwMzOWZCqVOHRZBM+lS0JwQNGrNJMtshKWiKAZ1F+iZyG6
	7tLOKY3PGTx4x+NUJHhyTcsGZomT4ucUPVsLwjUE+CObKcf9CMQKjUETdinNLrRp
	r40+mvuTuVaSJEQpN0jn8DuALIFAP3joP2znT0ju+n9kzYh2EpU38jEntiWcbcJ4
	UnKR2l6ncPrZgNvACOpVAJJsT8XT4kWFRZBxHfN2YgcXkwdXO8Hxr3ZjbVNs7COl
	TUEOZjnPew3bI/GLCGYTffqHNNc8WKL+FSn0YtevzeRJJEEWg7d2D5dpsugcagIl
	GlYBrg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp7aup3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:07:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A97Ui1014362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:07:30 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:07:27 -0700
Message-ID: <341b0323-06b4-44f4-92dc-8299c99f9660@quicinc.com>
Date: Mon, 10 Jun 2024 14:37:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] misc: fastrpc: Add static PD restart support
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-6-quic_ekangupt@quicinc.com>
 <c007308b-4641-44a5-9e64-fb085cced2b0@linaro.org>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <c007308b-4641-44a5-9e64-fb085cced2b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kKrFW0KOjtP43TW1elgSeqR427qkryFK
X-Proofpoint-ORIG-GUID: kKrFW0KOjtP43TW1elgSeqR427qkryFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100069



On 6/7/2024 7:15 PM, Caleb Connolly wrote:
>
>
> On 06/06/2024 18:59, Ekansh Gupta wrote:
>> Static PDs are created on DSPs to support specific use cases like Audio
>> and Sensors. The static PDs uses any CPU requirements like file
>> operations or memory need with the help of a daemon running on the CPU.
>> Audio and sensors daemons attaches to audio PD and sensors PD on DSP.
>> Audio PD expects some CMA memory for dynamic loading purpose which is
>> allocated and sent to DSP in fastrpc_init_create_static_process call.
>> For sensor daemon, the expectation is just to attach to sensors PD and
>> take up any requests made by the PD(like file operations etc.).
>>
>> Static PDs run on the audio and sensor supporting subsystem which can
>> be ADSP or SDSP. They are expected to support PD restart. There are some
>> CPU resources like buffers etc. for static PDs which are expected to be
>> cleaned up by fastrpc driver during PDR scenario. For this, there is a
>> requirement of PD service locator to get the event notifications for
>> static PD services. Also when events are received, the driver needs to
>> handle based on PD states.
>>
>> PDR handling is required for static PD only. There are no static PD
>> supported on MDSP or CDSP hence no PDR handling is required. PDR is also
>> not required for root_pd as if root_pd is shutting down, that basically
>> suggests that the remoteproc itself is shutting down which is handled
>> with rpmsg functionalities(probe and remove).
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>   drivers/misc/Kconfig   |   2 +
>>   drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---
>
> I think this justifies introducing a new C file. The functionality added here should be quite easily abstracted behind a sensible interface.
Thanks for the suggestion, Caleb. I'm dropping this patch from the series for now. I'll move PD notification specific implementations
to a new C file and send the patches separately. I'll also address all your comments there.

--ekansh
>>   2 files changed, 195 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index faf983680040..e2d83cd085b5 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -280,8 +280,10 @@ config QCOM_FASTRPC
>>       tristate "Qualcomm FastRPC"
>>       depends on ARCH_QCOM || COMPILE_TEST
>>       depends on RPMSG
>> +    depends on NET
>>       select DMA_SHARED_BUFFER
>>       select QCOM_SCM
>> +    select QCOM_PDR_HELPERS
>>       help
>>         Provides a communication mechanism that allows for clients to
>>         make remote method invocations across processor boundary to
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index abdd35b7c3ad..13e368279765 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/firmware/qcom/qcom_scm.h>
>>   #include <uapi/misc/fastrpc.h>
>>   #include <linux/of_reserved_mem.h>
>> +#include <linux/soc/qcom/pdr.h>
>>     #define ADSP_DOMAIN_ID (0)
>>   #define MDSP_DOMAIN_ID (1)
>> @@ -29,6 +30,7 @@
>>   #define CDSP_DOMAIN_ID (3)
>>   #define FASTRPC_DEV_MAX        4 /* adsp, mdsp, slpi, cdsp*/
>>   #define FASTRPC_MAX_SESSIONS    14
>> +#define FASTRPC_MAX_SPD        4
>
> Why 4? This patch only makes use of two.
>>   #define FASTRPC_MAX_VMIDS    16
>>   #define FASTRPC_ALIGN        128
>>   #define FASTRPC_MAX_FDLIST    16
>> @@ -105,6 +107,18 @@
>>     #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   +#define AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME   "audio_pdr_adsp"
>> +#define AUDIO_PDR_ADSP_SERVICE_NAME              "avs/audio"
>> +#define ADSP_AUDIOPD_NAME                        "msm/adsp/audio_pd"
>> +
>> +#define SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME   "sensors_pdr_adsp"
>> +#define SENSORS_PDR_ADSP_SERVICE_NAME              "tms/servreg"
>> +#define ADSP_SENSORPD_NAME                       "msm/adsp/sensor_pd"
>> +
>> +#define SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME "sensors_pdr_slpi"
>> +#define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
>> +#define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
>
> This data should be defined in some const static data struct, not as a bunch of macros, then you can actually describe the relationship between a domain_id and the fact that the ADSP registers two PDR lookups. See my comments in fastrpc_setup_service_locator() and where it's called in probe.
>
> struct fastrpc_pdr_domain {
>     const char *servloc_client_name;
>     const char *service_name;
>     const char *pd_name;
> };
>
> static const struct fastrpc_pdr_domain adsp_pdr_services[] = {
>     {
>         .servloc_client_name = "audio_pdr_adsp";
>         .service_name = "avs/audio";
>         .pd_name = "msm/adsp/audio_pd";
>     },
>     {
>         .servloc_client_name = "sensors_pdr_adsp";
>         ...
> };
>> +
>>   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>                           "sdsp", "cdsp"};
>>   struct fastrpc_phy_page {
>> @@ -259,6 +273,15 @@ struct fastrpc_session_ctx {
>>       bool valid;
>>   };
>>   +struct fastrpc_static_pd {
>> +    char *servloc_name;
>> +    char *spdname;
>> +    void *pdrhandle;
>> +    struct fastrpc_channel_ctx *cctx;
>> +    struct fastrpc_user *fl;
>> +    bool ispdup;
>> +};
>> +
>>   struct fastrpc_channel_ctx {
>>       int domain_id;
>>       int sesscount;
>> @@ -266,6 +289,7 @@ struct fastrpc_channel_ctx {
>>       struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
>>       struct rpmsg_device *rpdev;
>>       struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>> +    struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
>>       spinlock_t lock;
>>       struct idr ctx_idr;
>>       struct list_head users;
>> @@ -297,10 +321,12 @@ struct fastrpc_user {
>>       struct fastrpc_channel_ctx *cctx;
>>       struct fastrpc_session_ctx *sctx;
>>       struct fastrpc_buf *init_mem;
>> +    struct fastrpc_static_pd *spd;
>>         int tgid;
>>       int pd;
>>       bool is_secure_dev;
>> +    char *servloc_name;
>
> This is duplicated from spd->servloc_name
>>       /* Lock for lists */
>>       spinlock_t lock;
>>       /* lock for allocations */
>> @@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>       return false;
>>   }
>>   +static struct fastrpc_static_pd *fastrpc_get_spd_session( > +                struct fastrpc_user *fl)
>
> Every caller of this function has the same handling (checking !spd and then !spd->ispdup and returning different errors in each case). Please lift this common error handling into this function. While at it, I'd propose dropping the opaque *fl pointer and instead passing in the data which is actually used. The servloc_name could be looked up from the fastrpc_pdr_domain data.
>
> static int fastrpc_pdr_is_up(int pd, int domain_id, struct        
>                  fastrpc_static_pd *spds,
>                  struct fastrpc_static_pd *spd)
>> +{
>> +    int i;
>> +    struct fastrpc_static_pd *spd = NULL;
>> +    struct fastrpc_channel_ctx *cctx = fl->cctx;
>> +
>> +    for (i = 0; i < FASTRPC_MAX_SPD ; i++) {
>> +        if (!cctx->spd[i].servloc_name)
>> +            continue;
>> +        if (!strcmp(fl->servloc_name, cctx->spd[i].servloc_name)) {
>> +            spd = &cctx->spd[i];
>> +            spd->fl = fl;
>> +            break;
>> +        }
>> +    }
>> +
>> +    return spd;
>> +}
>> +
>>   static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>                             char __user *argp)
>>   {
>>       struct fastrpc_init_create_static init;
>>       struct fastrpc_invoke_args *args;
>>       struct fastrpc_phy_page pages[1];
>> +    struct fastrpc_static_pd *spd = NULL;
>>       char *name;
>>       int err;
>>       struct {
>> @@ -1270,6 +1317,19 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>           goto err_name;
>>       }
>>   +    fl->servloc_name = AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME;
>> +
>> +    spd = fastrpc_get_spd_session(fl);
>> +    if (!spd) {
>> +        err = -EUSERS;
>> +        goto err_name;
>> +    }
>> +
>> +    if (!spd->ispdup) {
>> +        err = -ENOTCONN;
>> +        goto err_name;
>> +    }
>> +    fl->spd = spd;
>>       if (!fl->cctx->remote_heap) {
>>           err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>>                           &fl->cctx->remote_heap);
>> @@ -1645,6 +1705,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>   {
>>       struct fastrpc_invoke_args args[1];
>> +    struct fastrpc_static_pd *spd = NULL;
>>       int tgid = fl->tgid;
>>       u32 sc;
>>   @@ -1654,6 +1715,22 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>>       sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>>       fl->pd = pd;
>>   +    if (pd == SENSORS_PD) {
>
> Why is this only relevant for the sensors pd?
>> +        if (fl->cctx->domain_id == ADSP_DOMAIN_ID)
>> +            fl->servloc_name = SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
>> +        else if (fl->cctx->domain_id == SDSP_DOMAIN_ID)
>> +            fl->servloc_name = SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
> What if domain_id isn't either of these? Should this be checked? If not, why?
>
> This whole block could be replaced with a call to the fastrpc_pdr_is_up() function I proposed.
>> +
>> +        spd = fastrpc_get_spd_session(fl);
>> +        if (!spd)
>> +            return -EUSERS;
>> +
>> +        if (!spd->ispdup)
>> +            return -ENOTCONN;
>> +
>> +        fl->spd = spd;
>> +    }
>> +
>>       return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>>                          sc, &args[0]);
>>   }
>> @@ -2129,6 +2206,64 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>>       return err;
>>   }
>>   +static void fastrpc_notify_users(struct fastrpc_user *user)
>> +{
>> +    struct fastrpc_invoke_ctx *ctx;
>> +
>> +    spin_lock(&user->lock);
>> +    list_for_each_entry(ctx, &user->pending, node) {
>> +        ctx->retval = -EPIPE;
>> +        complete(&ctx->work);
>> +    }
>> +    spin_unlock(&user->lock);
>> +}
>> +
>> +static void fastrpc_notify_pdr_drivers(struct fastrpc_channel_ctx *cctx,
>> +        char *servloc_name)
>> +{
>> +    struct fastrpc_user *fl;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&cctx->lock, flags);
>> +    list_for_each_entry(fl, &cctx->users, user) {
>> +        if (fl->servloc_name && !strcmp(servloc_name, fl->servloc_name))
>> +            fastrpc_notify_users(fl);
>> +    }
>> +    spin_unlock_irqrestore(&cctx->lock, flags);
>> +}
>> +
>> +static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
>> +{
>> +    struct fastrpc_static_pd *spd = (struct fastrpc_static_pd *)priv;
>> +    struct fastrpc_channel_ctx *cctx;
>> +
>> +    if (!spd)
>> +        return;
>> +
>> +    cctx = spd->cctx;
>> +    switch (state) {
>> +    case SERVREG_SERVICE_STATE_DOWN:
>> +        dev_info(&cctx->rpdev->dev,
>> +            "%s: %s (%s) is down for PDR on %s\n",
>> +            __func__, spd->spdname,
>> +            spd->servloc_name,
>> +            domains[cctx->domain_id]);
>
> dev_dbg
>> +        spd->ispdup = false;
>> +        fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
>> +        break;
>> +    case SERVREG_SERVICE_STATE_UP:
>> +        dev_info(&cctx->rpdev->dev,
>> +            "%s: %s (%s) is up for PDR on %s\n",
>> +            __func__, spd->spdname,
>> +            spd->servloc_name,
>> +            domains[cctx->domain_id]);
>> +        spd->ispdup = true;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>>   static const struct file_operations fastrpc_fops = {
>>       .open = fastrpc_device_open,
>>       .release = fastrpc_device_release,
>> @@ -2248,6 +2383,39 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>       return err;
>>   }
>>   +static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char *client_name,
>> +            char *service_name, char *service_path, int domain, int spd_session)
>
> This function should instead take a struct fastrpc_pdr_domain *services array.
>> +{
>> +    int err = 0;
>> +    struct pdr_handle *handle = NULL;
>> +    struct pdr_service *service = NULL;
>> +
>> +    /* Register the service locator's callback function */
>> +    handle = pdr_handle_alloc(fastrpc_pdr_cb, &cctx->spd[spd_session]);
>> +    if (IS_ERR(handle)) {
>> +        err = PTR_ERR(handle);
>> +        goto bail;
>> +    }
>> +    cctx->spd[spd_session].pdrhandle = handle;
>> +    cctx->spd[spd_session].servloc_name = client_name;
>> +    cctx->spd[spd_session].spdname = service_path;
>> +    cctx->spd[spd_session].cctx = cctx;
>> +    service = pdr_add_lookup(handle, service_name, service_path);
>> +    if (IS_ERR(service)) {
>> +        err = PTR_ERR(service);
>> +        goto bail;
>> +    }
>> +    pr_info("fastrpc: %s: pdr_add_lookup enabled for %s (%s, %s)\n",
> dev_dbg
>> +        __func__, service_name, client_name, service_path);
>> +
>> +bail:
>> +    if (err) {
>> +        pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
> dev_err
>> +                __func__, service_name, client_name, service_path, err);
>> +    }
>> +    return err;
>> +}
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>       struct device *rdev = &rpdev->dev;
>> @@ -2326,6 +2494,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>           goto fdev_error;
>>       }
>>   +    if (domain_id == ADSP_DOMAIN_ID) {
>> +        err = fastrpc_setup_service_locator(data, AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME,
>> +            AUDIO_PDR_ADSP_SERVICE_NAME, ADSP_AUDIOPD_NAME, domain_id, 0);
>> +        if (err)
>> +            goto populate_error;
>> +
>> +        err = fastrpc_setup_service_locator(data,
>> +            SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME,
>> +            SENSORS_PDR_ADSP_SERVICE_NAME, ADSP_SENSORPD_NAME, domain_id, 1);
>
> I assume this is basically a nop on platforms where this service doesn't exist? A comment mentioning this would be nice.
>> +        if (err)
>> +            goto populate_error;
>> +    } else if (domain_id == SDSP_DOMAIN_ID) {
>> +        err = fastrpc_setup_service_locator(data,
>> +            SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
>> +            SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME, domain_id, 0);
>> +        if (err)
>> +            goto populate_error;
>> +    }
>
> This block should be moved into the domain_id switch/case which is directly above it.
>
>> +
>>       kref_init(&data->refcount);
>>         dev_set_drvdata(&rpdev->dev, data);
>> @@ -2355,24 +2542,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>       return err;
>>   }
>>   -static void fastrpc_notify_users(struct fastrpc_user *user)
>> -{
>> -    struct fastrpc_invoke_ctx *ctx;
>> -
>> -    spin_lock(&user->lock);
>> -    list_for_each_entry(ctx, &user->pending, node) {
>> -        ctx->retval = -EPIPE;
>> -        complete(&ctx->work);
>> -    }
>> -    spin_unlock(&user->lock);
>> -}
>> -
>>   static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   {
>>       struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
>>       struct fastrpc_buf *buf, *b;
>>       struct fastrpc_user *user;
>>       unsigned long flags;
>> +    int i;
>>         /* No invocations past this point */
>>       spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2393,6 +2569,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>       if (cctx->remote_heap)
>>           fastrpc_buf_free(cctx->remote_heap);
>>   +    for (i = 0; i < FASTRPC_MAX_SPD; i++) {
>> +        if (cctx->spd[i].pdrhandle)
>> +            pdr_handle_release(cctx->spd[i].pdrhandle);
>> +    }
>> +
>>       of_platform_depopulate(&rpdev->dev);
>>         fastrpc_channel_ctx_put(cctx);
>


