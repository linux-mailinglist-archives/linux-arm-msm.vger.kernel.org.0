Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0178C456256
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 19:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhKRSar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 13:30:47 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:44674 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232621AbhKRSaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 13:30:46 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIEiEYM004075;
        Thu, 18 Nov 2021 19:27:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kST35QHjE3V0REnjYkLa0vwE23IVL2b0RQCX7EBoynA=;
 b=oEaPmG8F8JO1826F/HlvpvHz7+GUiQkwTbDqOPeWTu85GZDcCL8TObMrHc2Y2Ua4kG66
 DhTD/zqna5jIqkPq1o1ONpHVgp7zJG/DXtLNrj0Hm7Ln/dtqN97n8/X0hnjkndKzFVyu
 jgJAJlOneiM5P+jCmUFbJAne07ENbmXXY/bKUIAHIH0XB4MnoEbnHHt2HTqafsgxTwPw
 GDlOV/GGkTs30HiNqBNQAHQgaux3O+9/29+0FFamLJm0deAB/ddaWxm5DEpgsP4vmhAP
 q6qsZJMu10hu8Op9qZJyFhBPKXwn0ftQkIO/GXoIHlin6VSXcDcuAyefTEMOtiByOkMD Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cdm1n3byv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Nov 2021 19:27:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 433F010002A;
        Thu, 18 Nov 2021 19:27:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2859523DCAB;
        Thu, 18 Nov 2021 19:27:41 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 18 Nov
 2021 19:27:40 +0100
Subject: Re: [PATCH] rpmsg: Fix documentation return formatting
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
 <20211118173842.GD2530497@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <dbd7ee08-4893-4065-9c27-8c40d9fbef58@foss.st.com>
Date:   Thu, 18 Nov 2021 19:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118173842.GD2530497@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/18/21 6:38 PM, Mathieu Poirier wrote:
> On Mon, Nov 08, 2021 at 03:01:26PM +0100, Arnaud Pouliquen wrote:
>> kernel documentation specification:
>> "The return value, if any, should be described in a dedicated section
>> named Return."
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>>  drivers/rpmsg/qcom_smd.c          |  2 +-
>>  drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
>>  drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
>>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> I have applied this set.  There is a few more instances in drivers/remoteproc
> that could be fixed the same way.

If nobody fix this before, I will address it when preparing the V2 for my
series on remoteproc virtio restructuring.

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 3f377a795b33..1030cfa80e04 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -427,7 +427,7 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
>>   * Allocates a local channel id and sends a RPM_CMD_OPEN message to the remote.
>>   * Will return with refcount held, regardless of outcome.
>>   *
>> - * Returns 0 on success, negative errno otherwise.
>> + * Return: 0 on success, negative errno otherwise.
>>   */
>>  static int qcom_glink_send_open_req(struct qcom_glink *glink,
>>  				    struct glink_channel *channel)
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 8da1b5cb31b3..540e027f08c4 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1467,7 +1467,7 @@ ATTRIBUTE_GROUPS(qcom_smd_edge);
>>   * @parent:    parent device for the edge
>>   * @node:      device_node describing the edge
>>   *
>> - * Returns an edge reference, or negative ERR_PTR() on failure.
>> + * Return: an edge reference, or negative ERR_PTR() on failure.
>>   */
>>  struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>>  					     struct device_node *node)
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index d3eb60059ef1..f031b2b1b21c 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -26,7 +26,7 @@
>>   * @rpdev: rpmsg device
>>   * @chinfo: channel_info to bind
>>   *
>> - * Returns a pointer to the new rpmsg device on success, or NULL on error.
>> + * Return: a pointer to the new rpmsg device on success, or NULL on error.
>>   */
>>  struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>>  					  struct rpmsg_channel_info *chinfo)
>> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(rpmsg_create_channel);
>>   * @rpdev: rpmsg device
>>   * @chinfo: channel_info to bind
>>   *
>> - * Returns 0 on success or an appropriate error value.
>> + * Return: 0 on success or an appropriate error value.
>>   */
>>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>>  			  struct rpmsg_channel_info *chinfo)
>> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(rpmsg_release_channel);
>>   * dynamically assign them an available rpmsg address (drivers should have
>>   * a very good reason why not to always use RPMSG_ADDR_ANY here).
>>   *
>> - * Returns a pointer to the endpoint on success, or NULL on error.
>> + * Return: a pointer to the endpoint on success, or NULL on error.
>>   */
>>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>>  					rpmsg_rx_cb_t cb, void *priv,
>> @@ -146,7 +146,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>>  {
>> @@ -175,7 +175,7 @@ EXPORT_SYMBOL(rpmsg_send);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>>  {
>> @@ -206,7 +206,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  			  void *data, int len)
>> @@ -235,7 +235,7 @@ EXPORT_SYMBOL(rpmsg_send_offchannel);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>>  {
>> @@ -263,7 +263,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>>  {
>> @@ -282,7 +282,7 @@ EXPORT_SYMBOL(rpmsg_trysendto);
>>   * @filp:	file for poll_wait()
>>   * @wait:	poll_table for poll_wait()
>>   *
>> - * Returns mask representing the current state of the endpoint's send buffers
>> + * Return: mask representing the current state of the endpoint's send buffers
>>   */
>>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  			poll_table *wait)
>> @@ -313,7 +313,7 @@ EXPORT_SYMBOL(rpmsg_poll);
>>   *
>>   * Can only be called from process context (for now).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  			     void *data, int len)
>> @@ -623,7 +623,7 @@ EXPORT_SYMBOL(rpmsg_unregister_device);
>>   * @rpdrv: pointer to a struct rpmsg_driver
>>   * @owner: owning module/driver
>>   *
>> - * Returns 0 on success, and an appropriate error value on failure.
>> + * Return: 0 on success, and an appropriate error value on failure.
>>   */
>>  int __register_rpmsg_driver(struct rpmsg_driver *rpdrv, struct module *owner)
>>  {
>> @@ -637,7 +637,7 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
>>   * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
>>   * @rpdrv: pointer to a struct rpmsg_driver
>>   *
>> - * Returns 0 on success, and an appropriate error value on failure.
>> + * Return: 0 on success, and an appropriate error value on failure.
>>   */
>>  void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
>>  {
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 9c112aa65040..c37451512835 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -547,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
>>   * should use the appropriate rpmsg_{try}send{to, _offchannel} API
>>   * (see include/linux/rpmsg.h).
>>   *
>> - * Returns 0 on success and an appropriate error value on failure.
>> + * Return: 0 on success and an appropriate error value on failure.
>>   */
>>  static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>>  				     u32 src, u32 dst,
>> -- 
>> 2.17.1
>>
